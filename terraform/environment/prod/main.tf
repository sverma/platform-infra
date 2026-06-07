module "vpc" { 
    source = "../../modules/vpc" 
    name = var.name
    region = var.region 
    subnet_cidr = var.subnet_cidr
    pods_cidr = var.pods_cidr
    services_cidr = var.services_cidr
} 


module "gke" { 
  source = "../../modules/gke" 
  cluster_name = var.cluster_name
  name = var.name
  region = var.region 
  network = module.vpc.network
  subnetwork = module.vpc.subnetwork
  primary_pool_node_count = var.primary_pool_node_count
  subnet_cidr = var.subnet_cidr
  pods_cidr = var.pods_cidr
  services_cidr = var.subnet_cidr
  node_disk_size = var.node_disk_size
}

# module "gateway_api" { 
#     source = "../../modules/gateway-api" 
# }

# module "envoy_gateway" { 
#     source = "../../modules/envoy-gateway" 
#     depends_on = [ module.gateway_api ] 
# } 
# module "argocd" { 
#     source = "../../modules/argocd" 
#     #depends_on = [ module.envoy_gateway ] 
# }

# module "cloud_dns" {

#   source = "../../modules/cloud-dns"

#   project_id = var.project_id

#   domain_name = var.domain_name

#   zone_name = "platform-zone"
# }

# module "external_dns" {
#     source = "../../modules/external-dns"
# }

# module "bootstrap" {
#     source = "../../modules/argocd-bootstrap"
# }

# module "iam" {
#     source = "../../modules/iam"
#     project_id = var.project_id
# }