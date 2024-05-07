module "stack" {
  source           = "git@github.com:chanzuckerberg/happy//terraform/modules/happy-stack-eks?ref=main"
  app_name         = "edu-math-api-app"
  image_tag        = var.image_tag
  image_tags       = jsondecode(var.image_tags)
  stack_name       = var.stack_name
  deployment_stage = "rdev"
  stack_prefix     = "/${var.stack_name}"
  k8s_namespace    = "edu-platform-rdev-happy-happy-env"

  // this allow these services under the same domain
  // each service is reachable via their path configured below
  routing_method = "CONTEXT"
  enable_service_mesh = false

  services = {
    edu-math-api = {
      name                  = "edu-math-api",
      desired_count         = 1,
      port                  = 3456,
      memory                = "500Mi",
      cpu                   = "500m",
      health_check_path     = "/health",
      service_type          = "EXTERNAL", // INTERNAL, PRIVATE, EXTERNAL
      aws_iam_policy_json   = ""
      platform_architecture = "arm64"
    },
  }
  tasks = {
  }

  additional_env_vars_from_secrets = {
  }
  additional_env_vars = {
    "NODE_ENV"                = "production"
    "PORT"                    = "3456"
    "SCALING_FACTOR"          = "10" 
  }
}
