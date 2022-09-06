provider "aws" {
  region = "eu-central-1"
}
locals {
  resource_name = "Rameez"
}

# module "roles" {
#   source          = "./modules/roles"
#   RESOURCE_PREFIX = local.resource_name
# }
# module "policy" {
#   source          = "./modules/policy"
#   RESOURCE_PREFIX = local.resource_name
#   ROLE_NAME       = module.roles.iam_for_lambda_name

#   depends_on = [
#     # module.roles
#   ]
# }
# module "lambda" {
#   source          = "./modules/lambda"
#   RESOURCE_PREFIX = local.resource_name
#   ROLES_ARN       = module.roles.iam_for_lambda_arn

# }

module "vpc_example_complete-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.resource_name}-my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24","10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# module "cloudwatchEvent" {
#   source = "./modules/cloudwatchevents"
#   RESOURCE_PREFIX = local.resource_name
#   DESCRIPTION = "${local.resource_name}-rule_description"
#   EVENT_PATTERN = "{\n    \"source\" : [\"aws.codecommit\"],\n    \"detail-type\" : [\"CodeCommit Repository State Change\"],\n    \"resources\" : [\"arn:aws:codecommit:eu-central-1:489994096722:ApprokoWebapp\"],\n    \"detail\" : {\n      \"event\" : [\"referenceCreated\", \"referenceUpdated\"],\n      \"referenceType\" : [\"branch\"],\n      \"referenceName\" : [\"master\"]\n    }\n  }"
#   PIPELINE_ARN = "arn:aws:codepipeline:eu-central-1:489994096722:rameez-testpipeline"
#   ROLE_ARN = "arn:aws:iam::489994096722:role/service-role/cwe-role-eu-central-1-rameez-testpipeline"
# }