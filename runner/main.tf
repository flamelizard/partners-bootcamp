
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "tfstate-pcpxjg0p"
    key    = "state/ec2Provisioner.tfstate"
    region = "us-east-1"
  }
}

module "ec2Provisioner" {
  source = "flamelizard/ec2Provider/aws"
  instance_type = "t3.small"
  version       = "v0.0.1"
}

output "backend_config" {
  value = module.ec2Provisioner.public_dns
}
