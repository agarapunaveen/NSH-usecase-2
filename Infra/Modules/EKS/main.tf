resource "aws_security_group" "eks_sg" {
  name        = "eks-cluster-sg"
  description = "EKS cluster security group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0          # Allow all ports for egress traffic
    to_port     = 0          # Allow all ports for egress traffic
    protocol    = "-1"       # All protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere
  }
  
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere
  }

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS traffic from anywhere
  }

  tags = {
    Name = "eks-cluster-sg"
  }
}

/*resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = [aws_security_group.eks_sg.id]
  }

  tags = {
    Name = var.cluster_name
  }
}


resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  tags = {
    Name = "${var.cluster_name}-worker-nodes"
  }

  depends_on = [aws_eks_cluster.eks]
} */


module "eks" {
  source = "terraform-aws-modules/eks/aws"
  
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  
  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.medium"]
    }
  }
}




/*resource "kubernetes_deployment" "Appointmentdeployment" {
  metadata {
    name      = "appointment-deployment"
    namespace = "default"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "appointment-deployment"  # Ensure this matches the service selector
      }
    }
    template {
      metadata {
        labels = {
          app = "appointment-deployment"
        }
      }
      spec {
        container {
          name  = "appointment-container"
          image = var.image_url
          port {
            container_port = 3001
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "AppointmentService" {
  metadata {
    name      = "appointment-service"
    namespace = "default"
  }
  spec {
    selector = {
      app = "appointment-deployment"  # Update to match the deployment label
    }
    port {
      protocol   = "TCP"
      port       =  80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "Patientdeployment" {
  metadata {
    name      = "patient-deployment"
    namespace = "default"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "patient-deployment"  # Ensure this matches the service selector
      }
    }
    template {
      metadata {
        labels = {
          app = "patient-deployment"
        }
      }
      spec {
        container {
          name  = "patient-container"
          image = var.image_url_patient
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "PatientService" {
  metadata {
    name      = "patient-service"
    namespace = "default"
  }
  spec {
    selector = {
      app = "patient-deployment"  # Update to match the deployment label
    }
    port {
      protocol   = "TCP"
      port       = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}


provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "my-app"
    labels = {
      app = "my-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          image = "your-docker-image:tag"  # Replace with your image
          name  = "my-app"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "my-app"
  }

  spec {
    selector = {
      app = "my-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}


*/
