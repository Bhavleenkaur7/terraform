provider "aws" {
  region = "ap-south-1"
  
}

terraform {
  backend "s3" {
    bucket = "tfstate-terraform"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

module "ec2" {
  source        = "./ec2-stack"
  ami_id        = var.ami_id
  name          = var.name
  ec2_subnet_id = var.ec2_subnet_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )
  volume_size = var.volume_size
  vpc_id      = var.vpc_id
  port        = var.port
  protocol    = var.protocol
  arn         = var.arn
  #variables               = "${var.variables}"
}

