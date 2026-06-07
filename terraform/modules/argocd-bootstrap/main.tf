resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {

  name = "argocd"

  repository = "https://argoproj.github.io/argo-helm"

  chart = "argo-cd"

  namespace = "argocd"

  depends_on = [ kubernetes_namespace_v1.argocd ]

  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}

resource "kubectl_manifest" "root_app_stage" {

  depends_on = [
    helm_release.argocd
  ]

  yaml_body = file("${path.module}/root-app-stage.yaml")
}

resource "kubectl_manifest" "root_app_prod" {

  depends_on = [
    helm_release.argocd
  ]

  yaml_body = file("${path.module}/root-app-prod.yaml")
}

resource "kubectl_manifest" "root_app_platform_stage" {

  depends_on = [
    helm_release.argocd
  ]

  yaml_body = file("${path.module}/root-app-plaform-stage.yaml")
}

resource "kubectl_manifest" "root_app_platform_prod" {

  depends_on = [
    helm_release.argocd
  ]

  yaml_body = file("${path.module}/root-app-platform-prod.yaml")
}
