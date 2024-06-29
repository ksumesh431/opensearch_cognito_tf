# resource "aws_iam_service_linked_role" "es" {
#   aws_service_name = var.aws_service_name_for_linked_role
# }

resource "time_sleep" "role_dependency" {
  create_duration = "20s"

  triggers = {
    role_arn       = try(aws_iam_role.cognito_es_role[0].arn, null),
    #linked_role_id = try(aws_iam_service_linked_role.es.id, "11111")
  }
}


resource "aws_opensearch_domain" "opensearch" {
  domain_name    = var.cluster_name
  engine_version = var.engine_version

  advanced_security_options {
    enabled                        = var.advanced_security_options_enabled
    internal_user_database_enabled = var.internal_user_database_enabled
    
  }

  #advanced_options = var.advanced_options



  dynamic "cognito_options" {
    for_each = var.cognito_enabled ? [1] : []
    content {
      enabled          = var.cognito_enabled
      user_pool_id     = var.implicit_create_cognito == true ? aws_cognito_user_pool.user_pool[0].id : var.user_pool_id
      identity_pool_id = var.identity_pool_id == "" && var.implicit_create_cognito == true ? aws_cognito_identity_pool.identity_pool[0].id : var.identity_pool_id
      #identity_pool_id = aws_cognito_identity_pool.identity_pool[0].id   
      role_arn         = var.implicit_create_cognito == true ? time_sleep.role_dependency.triggers["role_arn"] : var.cognito_role_arn
    }
  }

  cluster_config {
    instance_type            = var.instance_type
    dedicated_master_enabled = try(var.cluster_config["dedicated_master_enabled"], true)
    #software_update_options  = try(var.software_update_options["Automatic software update"], true)
    dedicated_master_count   = try(var.cluster_config["dedicated_master_count"], 3)
    dedicated_master_type    = try(var.cluster_config["dedicated_master_type"], "m6g.large.search")
    instance_count           = try(var.cluster_config["instance_count"], 3)
    warm_enabled             = try(var.cluster_config["warm_enabled"], false)
    warm_count               = try(var.cluster_config["warm_enabled"], false) ? try(var.cluster_config["warm_count"], null) : null
    warm_type                = try(var.cluster_config["warm_type"], false) ? try(var.cluster_config["warm_type"], null) : null
    zone_awareness_enabled   = try(var.cluster_config["zone_awareness_enabled"], true)
    dynamic "zone_awareness_config" {
      for_each = try(var.cluster_config["avability_zone_count"], 3) > 1 && try(var.cluster_config["zone_awareness_enabled"], true) ? [3] : [1]
      content {
        availability_zone_count = try(var.cluster_config["avability_zone_count"], 3)

      }
    }
  }

  encrypt_at_rest {
    enabled    = try(var.encrypt_at_rest["enabled"], true)
    kms_key_id = try(var.encrypt_at_rest["kms_key_id"], "")
  }

  dynamic "log_publishing_options" {
    for_each = try(var.log_publishing_options["audit_logs_enabled"], false) ? [1] : []
    content {
      enabled                  = try(var.log_publishing_options["audit_logs_enabled"], false)
      log_type                 = "AUDIT_LOGS"
      cloudwatch_log_group_arn = try(var.log_publishing_options["audit_logs_cw_log_group_arn"], null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = try(var.log_publishing_options["application_logs_enabled"], false) ? [1] : []
    content {
      enabled                  = try(var.log_publishing_options["application_logs_enabled"], false)
      log_type                 = "ES_APPLICATION_LOGS"
      cloudwatch_log_group_arn = try(var.log_publishing_options["application_logs_cw_log_group_arn"], null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = try(var.log_publishing_options["index_logs_enabled"], false) ? [1] : []
    content {
      enabled                  = try(var.log_publishing_options["index_logs_enabled"], false)
      log_type                 = "INDEX_SLOW_LOGS"
      cloudwatch_log_group_arn = try(var.log_publishing_options["index_logs_cw_log_group_arn"], null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = try(var.log_publishing_options["search_logs_enabled"], false) ? [1] : []
    content {
      enabled                  = try(var.log_publishing_options["search_logs_enabled"], false)
      log_type                 = "SEARCH_SLOW_LOGS"
      cloudwatch_log_group_arn = try(var.log_publishing_options["search_logs_cw_log_group_arn"], null)
    }
  }


  ebs_options {
    ebs_enabled = var.ebs_enabled
    iops        = var.iops
    throughput  = var.throughput
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption
  }

  access_policies = var.access_policy == null && var.default_policy_for_fine_grained_access_control ? (<<CONFIG
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "es:*",
                "Principal": {
                  "AWS": "*"
                  },
                "Effect": "Allow",
                "Resource": ["arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}/*",
                            "arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}"]
            }
        ]
    }
    CONFIG 
  ) : var.access_policy

  domain_endpoint_options {
    enforce_https                   = var.domain_endpoint_options_enforce_https
    custom_endpoint_enabled         = var.custom_endpoint_enabled
    custom_endpoint                 = var.custom_endpoint_enabled ? var.custom_endpoint : null
    custom_endpoint_certificate_arn = var.custom_endpoint_enabled ? var.custom_endpoint_certificate_arn : null
    tls_security_policy             = var.tls_security_policy
  }
  tags       = var.tags
  #depends_on = [aws_cognito_user_pool.user_pool]
  #depends_on = [time_sleep.role_dependency,aws_cognito_user_pool.user_pool,aws_iam_service_linked_role.es]

}


