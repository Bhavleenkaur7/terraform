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
module "aspire" {
  source        = "./ec2-stack/"
  ami_id        = "ami-0bdd7ff8515b97d84"
  name          = "aspire"
  ec2_subnet_id = "subnet-06332e40"
  instance_type = "t2.micro"
  key_name      = "tothenew"
  tags          = {Name= "aspire", CreateBy = "terraform"}
  volume_size   = "20"
  vpc_id        = "vpc-a123f1c4"
  port          = "22"
  protocol      = "tcp"
  arn           = "arn:aws:elasticloadbalancing:us-east-1:743930152640:listener/app/ttn-infra/1930fc11e1df38d0/963819363385483e"
  associate_public_ip_address = "false"
  field         =  "host-header"
  value         =  "aspire.tothenew.net"
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
