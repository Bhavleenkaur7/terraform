provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}
terraform {
  backend "s3" {
    bucket = "test-terraform123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
module "ec2-alb" {
  source        = "./ec2-stack/"
  ami_id        = "ami-XXXXXXXX"
  name          = "test"
  ec2_subnet_id = "subnet-XXXXXx"
  instance_type = "t2.XXX"
  key_name      = "XXXXX.pem"
  #tags          = "Name = test-terraform"
  volume_size   = "20"
  vpc_id        = "vpc-XXXXXXX"
  port          = "22"
  protocol      = "tcp"
  arn           = "arn:XXXXXXXXX"
  associate_public_ip_address = "false"
  field         =  "host-header"
  value         = "aspire.tothenew.net"
}
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
