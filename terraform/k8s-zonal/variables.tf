# common
variable "cloud_id" {}
variable "folder_id" {}
variable "zone_name" {}

# network
variable "zone_net" {}

# k8s
variable "k8s_pod_cidr" {}
variable "k8s_service_cidr" {}

variable "k8s_nodes_main_count" {}
variable "k8s_nodes_main_cpu" {}
variable "k8s_nodes_main_cpu_fraction" {}
variable "k8s_nodes_main_mem" {}