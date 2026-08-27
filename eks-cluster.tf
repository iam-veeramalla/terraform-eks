module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  # EKS Managed Add-ons
  cluster_addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent = true
    }

    aws-ebs-csi-driver = {
      most_recent = true
    }
  }
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  tags = {
    cluster = "demo"
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2023_x86_64_STANDARD"
    instance_types         = ["t3.small"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    frontend = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]

      labels = {
        workload = "frontend"
      }
    }

    backend = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]

      labels = {
        workload = "backend"
      }
    }

    database = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]

      labels = {
        workload = "database"
      }
    }

    monitoring = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]

      labels = {
        workload = "monitoring"
      }
    }
  }
}
