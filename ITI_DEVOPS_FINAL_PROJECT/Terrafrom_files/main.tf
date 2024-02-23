module "network" {
  source               = "./1-NETWORK"
  vpc_name             = "Paula-MainVpc"
  vpc_cidr             = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  # ----------------------- #
  subnets                     = var.subnets
  availability_zones          = var.availability_zones
  auto_assign_public_ip_state = true
  eks_tag                     = "shared"
  # ----------------------- #
  cidr_from_anywhere = "0.0.0.0/0"
  public_route_name  = "public-route"
  private_route_name = "private-route"
  # ----------------------- #
  internet_gateway_name = "paula-IGW"
  natgateway_name       = "paula-NGW"
  # ----------------------- #
  security_group_name        = "paula-SG"
  security_group_description = "Allow HTTP traffic from anywhere"
  inport                     = ["80", "22", "443"]
  in_protocol                = "tcp"
  eg_port                    = 0
  eg_protocol                = "-1"
}
#-------------------------------------------#

module "IAM_EKS" {
  source        = "./3-IAM"
  role_name     = "eks_role"
  service_name  = "eks"
  policies_arns = var.eks_policies_arns
}


module "IAM_NODES" {
  source        = "./3-IAM"
  role_name     = "nodes_role1"
  service_name  = "ec2"
  policies_arns = var.nodes_policies_arns
}
#-------------------------------------------#
module "cluster" {
  source                  = "./2-EKS"
  clustername             = "Paula-cluster"
  eks_role_arn            = module.IAM_EKS.role_arn
  cluster_k8s_version     = "1.24"
  subnets_cluster         = [module.network.private_subnet_id1, module.network.private_subnet_id2]
  endpoint_private_access = true
  endpoint_public_access  = false
  eks_roles_attachments   = module.IAM_EKS
  eks_security_group_id   = [module.network.secgroup-id]
  #-------nodes_group-------#
  node_group_name         = "Paula_node_group"
  node_role_arn           = module.IAM_NODES.role_arn
  subnets_nodes           = [module.network.private_subnet_id1, module.network.private_subnet_id2]
  desired_size            = 1
  max_size                = 3
  min_size                = 1
  max_unavailable         = 1
  nodes_roles_attachments = module.IAM_NODES
}

module "EC2" {
  source                      = "./4-VMS"
  ec2_name                    = "jump_Ec2"
  ec2_ami                     = "ami-0557a15b87f6559cf"
  ec2_type                    = "t2.micro"
  SG_id                       = [module.network.secgroup-id]
  ec2_subnet_ID               = module.network.public_subnet_id1
  associate_public_ip_address = true
  key_pair                    = "paula"
  # vm_role = module.IAM_NODES.role_name
}