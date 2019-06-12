provider "aws" {
    region = "ap-south-1"
}

module "ec2" {
  source        = "./module/ec2"
  ami_id        = var.ami_id
  name          = var.name
  ec2_subnet_id = var.ec2_subnet_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags          = var.tags
  volume_size   = var.volume_size
  vpc_id        = var.vpc_id
  port          = var.port
  protocol      = var.protocol
  arn           = var.arn
  field         = var.field
  associate_public_ip_address = var.associate_public_ip_address
  #variables               = "${var.variables}"
}