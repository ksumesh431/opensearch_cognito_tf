# OpenSearch Domain with Cognito using Terraform

This repository contains Terraform configurations to create an OpenSearch domain integrated with Amazon Cognito for authentication in AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with necessary permissions
- AWS CLI configured with your credentials

## Resources Created

This Terraform configuration will create the following resources:

- OpenSearch Domain
- Amazon Cognito User Pool
- Amazon Cognito Identity Pool
- IAM roles and policies required for the OpenSearch and Cognito integration

## Usage

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ksumesh431/opensearch_cognito_tf.git
   cd opensearch_cognito_tf
