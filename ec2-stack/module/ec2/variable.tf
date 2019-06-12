variable "tags" {
  description = "Additional tags to be applied to all resources"
  type        = "map"
  default     = {Name = "test"}
}


# variable "name" {
#   description = "Unique name of your Terraform  to be used for naming and tagging resources"
#   type = "string"
# }

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI that will be launched"
  type = "string"
  default = "ami-06832d84cd1dbb448"
}

variable "ec2_subnet_id" {
  
}

variable "key_name" {

}

variable "public_key" {

}
variable "volume_size" {
}
variable "sg_id_ec2" {

}

variable "vpc_id" {
  default = "vpc-958fa0fd"
}

variable "associate_public_ip_address" {
  default = "false"
}
