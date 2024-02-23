variable "subnets" {
  type = map(any)
  default = {
    public_subnet1  = "10.0.0.0/24" ##each.key = each.value
    public_subnet2  = "10.0.1.0/24"
    private_subnet1 = "10.0.2.0/24"
    private_subnet2 = "10.0.3.0/24"
  }
}

variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}



#------------------#
variable "eks_policies_arns" {
  type = set(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
  ]
}
variable "nodes_policies_arns" {
  type = set(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  ]
}