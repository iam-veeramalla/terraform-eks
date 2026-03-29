module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.0.0"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  cluster_addons = {
    coredns = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni = { most_recent = true }
  }

  eks_managed_node_groups = {
    node_group = {
      ami_type        = "AL2_x86_64"
      instance_types  = ["t3.medium"]

      min_size     = 2
      max_size     = 6
      desired_size = 2

      attach_cluster_primary_security_group = false
      vpc_security_group_ids = [
        aws_security_group.all_worker_mgmt.id
      ]
    }
  }

  tags = {
    cluster = "demo"
  }
}
