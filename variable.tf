variable "aws_region" {
  description = "AWS Region"
  type = "string"
  default = "us-east-1"
}
variable "access_key" {
  description = "Enter your access key"
  type = "string"
}

variable "secret_key" {
  description = "Enter your secret key" 
  type =  "string"
}

variable "bucket" {
  description = "Enter name of the bucket that will be acting as terraform backend"
  type = "string"
  default = "ttn-infra-terraform"
}

variable "bucket_region" {
  description = "Region of S3 Bucket Region"
  type = "string"
  default = "us-east-1"
}