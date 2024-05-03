output "service_urls" {
  value       = module.stack.service_endpoints
  description = "The endpoints for the service"
  sensitive   = false
}

output "service_ecrs" {
  value       = module.stack.service_ecrs
  description = "The services ECR locations for their docker containers"
  sensitive   = false
}
