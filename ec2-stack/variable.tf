variable "name" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
  default = "test"
}

variable "tags" {
  description = "Additional tags to be applied to all resources"
  type = "map"
  default     = {Name= "test"}
}

variable "vpc_id" {
  description = "Id of the VPC to which your AMI will be deployed"
  type = "string"
  default = "vpc-958fa0fd"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI that will be launched"
  type = "string"
  default = "ami-06832d84cd1dbb448"
}

variable "port" {
  description = "Port of the EC2 instance to which the ALB will forward"
  default     = "8080"
}

variable "protocol" {
  description = "Protocol running on the port to which the ALB will forward"
  default     = "HTTP"
}

variable "key_name"{
  default = "bhavya1.pem"
}

variable "ec2_subnet_id" {
  description = "Subnet(s) to which the EC2 instance will be deployed"
  type = "string"
  default = "subnet-25890c69"
}

variable "volume_size" {
  description = "size of the volume attached with ec2"
  default     = "50"
}

#variable "instance_id" {
#  description = "instance_id of the ec2 instance"
#  default = ""
#}

variable "sg_id_ec2" {
  description = "sg for ec2"
  default = ""
}


#variable "sg_id_alb" {
 # description = "sg for alb"
 # default = ""
#}

variable "arn" {
  description = "alb arn"
  default = "arn:aws:elasticloadbalancing:ap-south-1:521141440450:listener/app/terraform-ec2/4da163a5881680a9/b509f31de06392f3" 
}

variable "value" {
  default = "aspire.tothenew.net" 
}
  
variable "field" {
  default = "host-header"
}
variable "associate_public_ip_address" {
  default = "false"
}
