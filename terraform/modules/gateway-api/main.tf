data "http" "gateway_api" {
  url = "https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml"
}

resource "kubectl_manifest" "gateway_api" {
  yaml_body = data.http.gateway_api.response_body
}
