provider "aws" {
  region = "us-east-1"
}


data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = module.eks.aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(module.eks.aws_eks_cluster.eks.certificate_authority.0.data)
} 

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    token                  = data.aws_eks_cluster_auth.eks.token
    cluster_ca_certificate = base64decode(module.eks.aws_eks_cluster.eks.certificate_authority.0.data)
  }
}




resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = jsonencode([
      {
        rolearn = module.iam.node_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = ["system:bootstrappers", "system:nodes"]
      }
    ])
    mapUsers = jsonencode([
  {
    userarn = "arn:aws:iam::010928202531:user/terraform-1"
    username = "terraform-1"
    groups = [
      "system:masters"
    ]
  }
])
}
}

