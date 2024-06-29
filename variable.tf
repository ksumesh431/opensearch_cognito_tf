variable "product" {
  description = "The name of the product"
  type        = string
  default     = "le1-glados-shared"
}


variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}


# Cognito IAM role variables
variable "implicit_create_cognito" {
  type        = bool
  description = "Cognito will be created inside module. It this is not enables and we want cognito authentication, we need to create cognito resources outside of module."
  default     = true
}


variable "azure_callback_metadata_url" {
  description = "App id for azure"
  type        = string
  default     = "https://login.microsoftonline.com/d2d0811b-0375-40a7-9dd7-0e0211763923/federationmetadata/2007-06/federationmetadata.xml?appid=ae55c631-f8c0-4f15-94c7-47872269b3ac"
}


# OpenSearch Cluster Variables





variable "domain_name" {
  description = "Domain Name of OpenSerach domain"
  type        = string
  default     = "opensearch-le1-glados-shared-auth"
}

variable "cluster_name" {
  description = "Name of OpenSerach domain and suffix of all other resources."
  type        = string
  default     = "le1-glados-shared"
}

variable "engine_version" {
  description = "Engine version of elasticsearch."
  type        = string
  default     = "OpenSearch_2.5"
}

variable "advanced_security_options_enabled" {
  type        = bool
  description = "If advanced security options is enabled."
  default     = false
}

variable "internal_user_database_enabled" {
  type        = bool
  description = "Internal user database enabled. This should be enabled if we want authentication with master username and master password."
  default     = false
}

variable "advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options."
  type        = map(string)
  default     = {}
}

variable "cognito_enabled" {
  description = "Cognito authentification enabled for OpenSearch."
  type        = bool
  default     = true
}



variable "identity_pool_id" {
  type        = string
  description = "Cognito identity pool id."
  default     = ""
}


variable "tags" {
  description = "Tags."
  type        = map(any)
  default     = {}
}

variable "tls_security_policy" {
  description = "TLS security policy."
  type        = string
  default     = "Policy-Min-TLS-1-2-2019-07"
}

variable "custom_endpoint_certificate_arn" {
  description = "Custom endpoint certificate."
  type        = string
  default     = null
}

variable "custom_endpoint_enabled" {
  description = "If custom endpoint is enabled."
  type        = bool
  default     = false
}

variable "domain_endpoint_options_enforce_https" {
  description = "Enforce https."
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "Instance type."
  type        = string
  default     = "r6g.xlarge.search"
}

variable "cluster_config" {
  description = "Auto tune options from documentation."
  type        = any
  default     = {}
}


variable "custom_endpoint" {
  description = "Custom endpoint https."
  type        = string
  default     = ""
}

variable "access_policy" {
  description = "Access policy to OpenSearch. If `default_policy_for_fine_grained_access_control` is enabled, this policy would be overwritten."
  type        = string
  default     = null
}

variable "default_policy_for_fine_grained_access_control" {
  type        = bool
  description = "Default policy for fine grained access control would be created."
  default     = false
}

variable "volume_size" {
  description = "Volume size of ebs storage."
  type        = number
  default     = 900
}

variable "volume_type" {
  description = "Volume type of ebs storage."
  type        = string
  default     = "gp2"
}
  
variable "throughput" {
  description = "Specifies the throughput."
  type        = number
  default     = null
}

variable "iops" {
  description = "Baseline input/output (I/O) performance of EBS volumes attached to data nodes."
  type        = number
  default     = null
}


variable "ebs_enabled" {
  type        = bool
  description = "EBS enabled"
  default     = true
}


variable "log_publishing_options" {
  description = "Encrypt at rest."
  type        = any
  default     = {}
}


variable "encrypt_at_rest" {
  description = "Encrypt at rest."
  type        = any
  default     = {}
}

variable "node_to_node_encryption" {
  type        = bool
  description = "Is node to node encryption enabled."
  default     = true
}


variable "user_pool_id" {
  type        = string
  description = "Cognito user pool id."
  default     = ""
}

variable "aws_service_name_for_linked_role" {
  type        = string
  description = "AWS service name for linked role."
  default     = "opensearchservice.amazonaws.com"
}

variable "cognito_role_arn" {
  type        = string
  description = "Cognito role ARN. We need to enable `advanced_security_options_enabled`."
  default     = ""
}
