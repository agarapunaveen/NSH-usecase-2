/*aws_region = "us-east-1"*/
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
/*security_groups = ["sg-09c3b12ec1c311254"] */
repo_name = "my-app-repo"
cluster_name   = "my-eks-cluster"
instance_types = ["t3.medium"]
desired_size   = 2
min_size       = 1
max_size       = 3
image_url = "010928202531.dkr.ecr.us-east-1.amazonaws.com/hackthon/usecase-2-appointment:latest"
image_url_patient = "010928202531.dkr.ecr.us-east-1.amazonaws.com/hackthon/usecase-2-patient:latest"
