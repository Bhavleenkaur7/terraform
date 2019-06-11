output "alb_arn" {
  value = "${module.alb.alb_arn}"
}

output "instance_id" {
  value = "${module.ec2.instance_id}"
}

output "public-ip" {
  value = "${module.ec2.public-ip}"
}

output "public_dns" {
  value = "${module.ec2.public_dns}"
}

output "sg_id_ec2" {
  value = "${module.securitygroup.sg_id_ec2}"
}

