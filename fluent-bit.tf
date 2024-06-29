provider "null" {}

provider "time" {}

provider "helm" {
  kubernetes {
    config_path = "/root/.kube/config"  
  }
}

provider "kubernetes" {
  config_path = "/root/.kube/config"  
} 

# resource "kubernetes_service_account" "fluent_bit" {
#   metadata {
#     name      = "fluent-bit"
#     namespace = "logging"
#     labels = {
#       "app.kubernetes.io/managed-by" = "Helm"
#     }
#     annotations = {
#       "meta.helm.sh/release-name"     = "fluent-bit"
#       "meta.helm.sh/release-namespace" = "logging"
#     }
#   }
# }

# resource "null_resource" "update_serviceaccount" {
#   triggers = {
#     always_run = timestamp()
#   }

#   provisioner "local-exec" {
#     command = <<EOF
#       kubectl label serviceaccount fluent-bit app.kubernetes.io/managed-by=Helm -n logging --kubeconfig=/root/.kube/config
#       kubectl annotate serviceaccount fluent-bit meta.helm.sh/release-name=fluent-bit -n logging --kubeconfig=/root/.kube/config
#       kubectl annotate serviceaccount fluent-bit meta.helm.sh/release-namespace=logging -n logging --kubeconfig=/root/.kube/config
#     EOF
#   }
# }

resource "helm_release" "fluent_bit" {
  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"
  # version    = "0.34.2"

  name       = "fluent-bit"
  namespace  = "logging"
  cleanup_on_fail = true

  values = [file("${path.module}/le1-values.yaml")] 
    

  # Ensure the null_resource runs before installing the Helm chart
  # depends_on = [
  #   null_resource.update_serviceaccount
  # ]
}