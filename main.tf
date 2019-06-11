provider "aws" {
  region = "ap-south-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}
terraform {
  backend "s3" {
    bucket = "${var.bucket}"
    key    = "terraform.tfstate"
    region = "${var.bucket_region}"
  }
}
module "ec2" {
  source        = "./ec2-stack/"
  ami_id        = "var.ami_id"
  name          = "var.name"
  ec2_subnet_id = "var.ec2_subnet_id"
  instance_type = "var.instance_type"
  key_name      = "var.key_name"
  tags          = "var.tags"
  volume_size   = "var.volume_size"
  vpc_id        = "var.vpc_id"
  port          = "var.port"
  protocol      = "var.protocol"
  arn           = "var.arn"
}
module "ecs-service" {
  source = "./ecs-service/modules/ecs-service/"

  name                  = "example"
  environment           = "testing"
  desired_count         = "1"
  cluster               = "example-cluster"
  vpc_id                = "vpc-XXXXXXX"
  zone_id               = "Z4KAPRWWNC7JR"
  iam_role              = "arn:aws:iam::12345678910:role/ec2_role"
  rule_priority         = "10"
  alb_listener          = "arn:aws:elasticloadbalancing:eu-west-1:12345678910:listener/app/example/1e590za2072344a6nc01fh545fb2301d1"
  alb_zone_id           = "Z4KAPRXXXC7JR"
  alb_dns_name          = "example"
  container_definitions = "${file("container_definitions.json")}"
}