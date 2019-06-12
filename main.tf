provider "aws" {
  region = "${var.aws_region}"
}
terraform {
  backend "s3" {
    bucket = "ttn-infra-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# module "ecs-service" {
#   source = "./ecs-service/"
#   name                  = "example"
#   environment           = "testing"
#   desired_count         = "1"
#   cluster               = "example-cluster"
#   vpc_id                = "vpc-XXXXXXX"
#   zone_id               = "Z4KAPRWWNC7JR"
#   iam_role              = "arn:aws:iam::12345678910:role/ec2_role"
#   rule_priority         = "10"
#   alb_listener          = "arn:aws:elasticloadbalancing:eu-west-1:12345678910:listener/app/example/1e590za2072344a6nc01fh545fb2301d1"
#   alb_zone_id           = "Z4KAPRXXXC7JR"
#   alb_dns_name          = "example"
#   container_definitions = "${file("container_definitions.json")}"
# }
