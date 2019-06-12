
## MODULE FOR ECS-SERVICE AND EC2-ALB
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_key | Enter your access key | string | n/a | yes |
| aws\_region | AWS Region | string | `"us-east-1"` | no |
| bucket | Enter name of the bucket that will be acting as terraform backend | string | `"ttn-infra-terraform"` | no |
| bucket\_region | Region of S3 Bucket Region | string | `"us-east-1"` | no |
| secret\_key | Enter your secret key | string | n/a | yes |



Usage
-----

# FOR EC2-ALB
EC2-ALB is hardcoded .

module "ec2-alb" {
  source        = "./ec2-stack/"
  ami_id        = "var.ami_id"
  name          = "var.name"
  ec2_subnet_id = "var.ec2_subnet_id"
  instance_type = "var.instance_type"
  key_name      = "var.key_name"
  tags          = "var.tags"
  volume_size   = "var.volume_size"
  vpc_id        = "var.vpc_id"
  port          = "var.port_ec2"
  protocol      = "var.protocol_ec2"
  arn           = "var.arn_of_alb"
  associate_public_ip_address = "var.public_ip"
}

# FOR ECS-SERVICE
Launch is set to false by default .
All the variables are directly hardcoded

module "ecs-service" {
  launch = false
  source = "./ecs-service/"
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

