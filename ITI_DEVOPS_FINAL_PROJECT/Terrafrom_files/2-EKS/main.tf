resource "aws_eks_cluster" "my_eks" {
  name     = var.clustername
  role_arn = var.eks_role_arn
  version  = var.cluster_k8s_version 
  vpc_config {
    subnet_ids = var.subnets_cluster
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    security_group_ids = var.eks_security_group_id

  }
  depends_on = [var.eks_roles_attachments]
}
#-------- Node Group --------#
resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.my_eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnets_nodes
  # disk_size
  # instance_types
  
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
remote_access {
    ec2_ssh_key = "paula"
  }
  update_config {
    max_unavailable = var.max_unavailable
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [ var.nodes_roles_attachments]
}