output "network_security_groups" {
  description = "Map (same keys as var.network_security_groups) of every output from each network security groups created -- see upstream module docs for the full shape."
  value       = module.network_security_group
}
