terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-autoscaling.git?ref=v3.1.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data", "../vpc"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}

dependency "vpc" {
  config_path = "../vpc"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/3.1.0?tab=inputs
###########################################################
inputs = {
  # The number of Amazon EC2 instances that should be running in the group
  # type: string
  desired_capacity = "0"

  # Controls how health checking is done. Values are - EC2 and ELB
  # type: string
  health_check_type = "EC2"

  # The EC2 image ID to launch
  # type: string
  image_id = dependency.aws-data.outputs.amazon_linux2_aws_ami_id

  # The size of instance to launch
  # type: string
  instance_type = "t2.small"

  # The maximum size of the auto scale group
  # type: string
  max_size = "0"

  # The minimum size of the auto scale group
  # type: string
  min_size = "0"

  # Creates a unique name beginning with the specified prefix
  # type: string
  name = "Metrics Autoscaling Group"

  # A list of security group IDs to assign to the launch configuration
  # type: list(string)
  security_groups = []

  # A list of subnet IDs to launch resources in
  # type: list(string)
  vpc_zone_identifier = dependency.vpc.outputs.private_subnets

  
}
