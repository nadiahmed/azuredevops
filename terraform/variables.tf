variable "resource_group_location" {
  default     = "australiaeast"
  description = "Location of the resource group."
  type        = string
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name"
  type        = string
}

variable "resource_group_name" {
  description = "Prefix of the resource group name"
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "acr_name" {
  type        = string
  description = "ACR name"
}


