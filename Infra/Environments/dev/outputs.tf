/*# ------------------------------
# VPC Outputs
# ------------------------------
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

# ------------------------------
# IAM Outputs
# ------------------------------
output "eks_cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  value       = module.iam.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "IAM Role ARN for EKS Worker Nodes"
  value       = module.iam.eks_node_role_arn
}

# ------------------------------
# ECR Outputs
# ------------------------------
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repo_url
}

# ------------------------------
# ALB Outputs
# ------------------------------
output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

# ------------------------------
# EKS Outputs
# ------------------------------
output "eks_cluster_id" {
  description = "ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_id" {
  description = "ID of the EKS Node Group"
  value       = module.eks.node_group_id
}

# ------------------------------
# Kubernetes Outputs
# ------------------------------
output "kubeconfig" {
  description = "Kubeconfig content for accessing the cluster"
  value       = module.eks.kubeconfig
}

output "patient_service_url" {
  description = "URL for the Patient Service"
  value       = module.kubernetes.patient_service_url
}

output "appointment_service_url" {
  description = "URL for the Appointment Service"
  value       = module.kubernetes.appointment_service_url
}

# ------------------------------
# Monitoring Outputs
# ------------------------------
output "log_group_arn" {
  description = "ARN of the CloudWatch Log Group"
  value       = module.monitoring.log_group_arn
}*/