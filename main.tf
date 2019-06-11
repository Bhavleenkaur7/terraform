provider "aws" {
  region = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "tfstate-terraform"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

module "ec2" {
  source        = "./ec2-alb/ec2-stack"
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

locals {
  name = "ecs-service"
  environment = "dev"
}
module "ecs-service" {
  name = "${local.name}"
  source = "./ecs-service/modules/ecs-service"
  alb_dns_name = "${var.alb_dns_name}"
  alb_listener = "${var.alb_listener}"
  alb_zone_id = "${var.alb_zone_id}"
  cluster = "${var.cluster}"
  container_definitions = "${var.container_definitions}"
  iam_role = "${var.iam_role}"
  rule_priority = "${var.rule_priority}"
  vpc_id = "${var.vpc_id}"
  zone_id = "${var.zone_id}"
}
