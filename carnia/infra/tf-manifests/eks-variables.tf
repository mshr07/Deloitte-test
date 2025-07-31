# EKS Cluster input variables
variable "cluster_name" {
    type        = string
    default     = "mock-sail-dev-eks"
    description = "EKS Cluster Name"
}

variable "cluster_service_ipv4_cidr" {
    type = string
    default = null
    description = "EKS Cluster Service IPv4 CIDR"
}

variable "cluster_version" {
    type = string
    default = null
    description = "EKS Cluster Version"
}

variable "cluster_endppoint_private_access" {
    type = bool
    default = false
    description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled" 
}

variable "cluster_endppoint_public_access" {
    type = bool
    default = true
    description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled" 
}

variable "cluster_endppoint_public_access_cidrs" {
    type = list(string)
    default = ["0.0.0.0/0"]
    description = "List of CIDR blocks whose traffic is allowed to access the Amazon EKS public API server endpoint"
}

# EKS NODE GROUP input variables
# Placeholder
