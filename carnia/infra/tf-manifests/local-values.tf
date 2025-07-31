locals {
    owners      = var.project
    environment = var.envrionment
    name        = "${var.project}-${var.envrionment}-vpc"
    common_tags = {
        owners              = local.owners
        environment         = local.environment
        eks_cluster_name = "${local.name}-${var.cluster_name}"
    }
}
