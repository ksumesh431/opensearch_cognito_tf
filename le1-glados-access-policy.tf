
resource "aws_elasticsearch_domain_policy" "le-glado-access-policy" {
  domain_name = "le1-glados-shared"  

  access_policies = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = [
            "arn:aws:iam::756759416234:role/le1-glados-shared-COGNITO-ACCESS-ES-ROLE",
            "arn:aws:iam::756759416234:role/le1-system-role",
            "arn:aws:iam::756759416234:role/glados-worker-role",
            "arn:aws:iam::756759416234:role/glados-system-role",
            "arn:aws:iam::756759416234:role/le1-worker-role",
          ]
        },
        Action = "es:*",
        Resource = "arn:aws:es:us-east-1:756759416234:domain/le1-glados-shared/*",
      },
      {
        Effect = "Allow",
        Principal = {
          AWS = "*"
        },
        Action = "es:ESHttp*",
        Resource = "arn:aws:es:us-east-1:756759416234:domain/le1-glados-shared/*",
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "*"
          }
        }
      },
      {
        Effect = "Allow",
        Principal = {
          AWS = "*"
        },
        Action = "es:*",
        Resource = "arn:aws:es:us-east-1:756759416234:domain/le1-glados-shared/*",
        Condition = {
          IpAddress = {
            "aws:SourceIp" = [
              "173.61.15.204",
              "52.70.224.189",
              "216.87.90.230",
              "10.111.0.0/16",
              "173.61.0.0/24",
              "3.217.171.197/32",
              "3.227.73.0/32",
              "3.234.42.230/32",
              "18.204.235.237/32",
              "18.232.30.126/32",
              "34.204.253.120/32",
              "34.205.233.46/32",
              "34.231.151.179/32",
              "35.173.154.142/32",
              "52.3.108.122/32",
              "52.4.168.0/32",
              "52.5.120.21/32",
              "52.45.226.34/32",
              "52.55.155.248/32",
              "52.73.34.234/32",
              "52.201.77.94/32",
              "54.83.252.163/32",
              "54.146.88.203/32",
              "54.156.105.40/32",
              "54.172.40.193/32",
              "54.204.102.217/32",
              "54.204.113.211/32",
              "54.237.164.14/32",
              "54.242.207.111/32",
              "54.243.244.175/32",
              "100.24.204.241/32",
              "107.21.116.39/32",
              "163.116.146.120/32",
              "52.6.55.160",
              "35.170.30.234"
            ]
          }
        }
      },
    ]
  })
}
