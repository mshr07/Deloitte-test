# Create EKS Node Group - Public
resource "aws_eks_node_group" "eKS_nodegroup_public" {
    cluster_name    = aws_eks_cluster.eKS_cluster.name
    node_group_name = "${local.name}-eKS-nodegroup-public"
    node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
    subnet_ids      = module.vpc.public_subnets
    version         = var.cluster_version // Optional setting: Default to EKS Cluster K8 Version

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    disk_size = 20
    instance_types = [ "t3.medium" ]

    remote_access {
      ec2_ssh_key = "mock-sail-key"
    }

    scaling_config {
        desired_size = 1
        max_size     = 2
        min_size     = 1
    }

    update_config {
        max_unavailable = 1
        # max_unavailable_percentage = 50
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly
    ]
    tags = {
        Name = "Public Node Group"
    }
}