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
locals {
  name = "ecs-service"
  environment = "dev"
}
module "ecs-service" {
  name = "${local.name}"
  source = "./modules/ecs-service"
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
