resource "aws_eks_cluster" "eKS_cluster" {
    name = "${local.name}-${var.cluster_name}" 
    role_arn = aws_iam_role.eks_master_role.arn 
    version = var.cluster_version

    vpc_config {
        subnet_ids = module.vpc.public_subnets
        endpoint_public_access = var.cluster_endppoint_public_access
        endpoint_private_access = var.cluster_endppoint_private_access      
        public_access_cidrs = var.cluster_endppoint_public_access_cidrs

    }

    kubernetes_network_config {
        service_ipv4_cidr = var.cluster_service_ipv4_cidr
    }

    # Enable K8 Cluster Logging
    enabled_cluster_log_types = [ "api", "audit", "authenticator", "controllerManager", "scheduler" ]
  
    # Ensure that IAM Permissions are created before and deleted after EKS Cluster Handling.access_config {
    # Otherwise EKS will not be able to properly delete the EKS managed EC2 instance profiles
    depends_on = [
        aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceControllerPolicy,
        ]
}
