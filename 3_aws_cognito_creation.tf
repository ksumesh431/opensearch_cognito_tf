resource "aws_cognito_user_pool" "user_pool" {
  count = var.cognito_enabled ? 1 : 0
  name  = "cognito-${var.cluster_name}"

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  auto_verified_attributes = ["email"]
  mfa_configuration        = "OFF"
  username_attributes      = ["email"]

  user_pool_add_ons {
    advanced_security_mode = "OFF"
  }
  schema {
  name                     = "sub"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = false  
  required                 = true 
  string_attribute_constraints { 
    min_length = 1    
    max_length = 2048 
    }
    
  }
  schema {
  name                     = "name"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = true 
  string_attribute_constraints { 
    min_length = 1    
    max_length = 2048 
    }
    
  }
  schema {
  name                     = "given_name"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }
  # schema {
  # name                     = "family_name"
  # attribute_data_type   = "String"
  # developer_only_attribute = false
  # mutable                  = true  
  # required                 = true 
  # string_attribute_constraints { 
  #   min_length = 0    
  #   max_length = 2048 
  #   }
  # }
  schema {
  name                     = "middle_name"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }
  schema {
  name                     = "nickname"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }          
  schema {
  name                     = "preferred_username"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  } 
  schema {
  name                     = "profile"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  } 
  schema {
  name                     = "picture"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }     
  schema {
  name                     = "website"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }       
  schema {
  name                     = "email"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = true 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
    
  }     
  schema {
  name                     = "email_verified"
  attribute_data_type      = "Boolean"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  }
  schema {
  name                     = "gender"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }     
  schema {
  name                     = "birthdate"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 10    
    max_length = 10 
    }
  }     
  schema {
  name                     = "zoneinfo"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }     
  schema {
  name                     = "locale"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }     
  schema {
  name                     = "phone_number"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }  
  # schema {
  # name                     = "phone_number_verified"
  # attribute_data_type                = "Boolean"
  # developer_only_attribute = false
  # mutable                  = true  
  # required                 = false 
  # }
  schema {
  name                     = "address"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    min_length = 0    
    max_length = 2048 
    }
  }           
  # schema {
  # name                     = "updated_at"
  # attribute_data_type   = "String"
  # developer_only_attribute = false
  # mutable                  = true  
  # required                 = false 
  # string_attribute_constraints { 
  #   min_length = 0    
  #   max_length = 2048 
  #   }
  # }         
  schema {
  name                     = "identities"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    }
  } 
  schema {
  name                     = "custom:Email"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    }
  } 
  schema {
  name                     = "custom:Name"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    }
  }   
  schema {
  name                     = "custom:Groups"
  attribute_data_type   = "String"
  developer_only_attribute = false
  mutable                  = true  
  required                 = false 
  string_attribute_constraints { 
    }
  } 
  password_policy {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 90
  }
}




# Federated identity provider sign-in
resource "aws_cognito_identity_provider" "cognito_identity_provider" {
  attribute_mapping = {
    name  = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    email = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
  }
  
  # Fill these details 
  provider_details = {
    SSORedirectBindingURI    = "https://login.microsoftonline.com/d2d0811b-0375-40a7-9dd7-0e0211763923/saml2"
    IDPSignout               = "false"
    MetadataURL              = var.azure_callback_metadata_url
    SLORedirectBindingURI    = "https://login.microsoftonline.com/d2d0811b-0375-40a7-9dd7-0e0211763923/saml2"
    ActiveEncryptionCertificate = ""
  }
  
  provider_name   = "Frontline"
  provider_type   = "SAML"
  user_pool_id    = aws_cognito_user_pool.user_pool[0].id
  depends_on = [
    aws_cognito_user_pool.user_pool
  ]
}

data "aws_opensearch_domain" "my_domain" {
  domain_name = var.cluster_name
  # depends_on =   [ 
  #   aws_opensearch_domain.opensearch
  # ]  
}




# App integration
resource "aws_cognito_user_pool_client" "client" {
  count = var.cognito_enabled ? 1 : 0
  name  = "user_client_${var.cluster_name}"

  user_pool_id        = aws_cognito_user_pool.user_pool[0].id
  #explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
  explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = ["email","openid","phone","profile"]
  allowed_oauth_flows_user_pool_client = true
  #refresh_token_validity = 60
  supported_identity_providers = ["Frontline"]
  
  callback_urls = ["https://${data.aws_opensearch_domain.my_domain.dashboard_endpoint}"]
  logout_urls = ["https://${data.aws_opensearch_domain.my_domain.dashboard_endpoint}"]

#   token_validity_units {
#     access_token  = "minutes"
#     id_token      = "minutes"
#     refresh_token = "days"
#   }  
  depends_on =    [ 
    aws_cognito_identity_provider.cognito_identity_provider
  ]
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  count        = var.cognito_enabled ? 1 : 0
  domain       = var.domain_name 
  user_pool_id = aws_cognito_user_pool.user_pool[0].id
}


resource "aws_cognito_identity_pool" "identity_pool" {
  count                            = var.cognito_enabled ? 1 : 0
  identity_pool_name               = "${var.cluster_name}_identity_pool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id     = aws_cognito_user_pool_client.client[0].id
    provider_name = aws_cognito_user_pool.user_pool[0].endpoint
  }

  lifecycle { ignore_changes = [cognito_identity_providers] }
}


//authenticated role
resource "aws_iam_role" "authenticated" {
  count = var.cognito_enabled ? 1 : 0
  name  = format("cognito_authenticated-%s", var.cluster_name)

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.identity_pool[0].id}"
        },
        "ForAnyValue:StringLike": {
          "cognito-identity.amazonaws.com:amr": "authenticated"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "authenticated" {
  count = var.cognito_enabled ? 1 : 0
  name  = format("authenticated_policy-%s", var.cluster_name)
  role  = aws_iam_role.authenticated[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "mobileanalytics:PutEvents",
        "cognito-sync:*",
        "cognito-identity:*"
      ],
      "Resource": [
        "*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": "es:*",
      "Resource": "*"
    }
  ]
}
EOF
}

#"Resource": "arn:aws:es:${var.region}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}"

//unauthenticated role
resource "aws_iam_role" "unauthenticated" {
  count = var.cognito_enabled ? 1 : 0
  name  = format("cognito_unauthenticated-%s", var.cluster_name)

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.identity_pool[0].id}"
        },
        "ForAnyValue:StringLike": {
          "cognito-identity.amazonaws.com:amr": "unauthenticated"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "unauthenticated" {
  count = var.cognito_enabled ? 1 : 0
  name  = format("unauthenticated_policy-%s", var.cluster_name)
  role  = aws_iam_role.unauthenticated[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "mobileanalytics:PutEvents",
        "cognito-sync:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}


resource "aws_cognito_identity_pool_roles_attachment" "roles_attachment" {
  count            = var.cognito_enabled ? 1 : 0
  identity_pool_id = aws_cognito_identity_pool.identity_pool[0].id

  roles = {
    "authenticated"   = aws_iam_role.authenticated[0].arn,
    "unauthenticated" = aws_iam_role.unauthenticated[0].arn,
  }
}


