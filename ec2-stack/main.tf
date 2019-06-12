module "ec2" {
  source = "./module/ec2"
  ami_id                  = "${var.ami_id}"
  #name                     = "${var.name}"
  #vpc                     = "${var.vpc_id}"
  ec2_subnet_id            = "${var.ec2_subnet_id}"
  instance_type           = "${var.instance_type}"
  #vpc_security_group_ids  = ["${module.ec2.sg_id_ec2}"]
  sg_id_ec2               = "${module.securitygroup.sg_id_ec2}" 
 # ebs_optimized           = "false"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name                = "${var.key_name}" 
  tags                    = "${var.tags}"
  #volume_tags             = "${merge(map("Name", "${var.name}"), var.tags)}"
  #disable_api_termination = "${var.data_protection}"
  volume_size           = "${var.volume_size}"
  #delete_on_termination = "${var.data_protection ? false : true}"
  #user_data               = "${var.user_data}"
}


module "securitygroup" {
  source             = "./module/securitygroup"
  name                = "${var.name}"
  vpc_id             = "${var.vpc_id}"  
  port               = "${var.port}"
}

module "alb" {
  source             = "./module/alb"
  name               = "${var.name}"
  arn                = "${var.arn}"
  #subnets            = "${var.alb_subnet_ids}"
  #alb_subnet_ids     = "${var.alb_subnet_ids}"
  tags               = "${var.tags}"
  port               = "${var.port}"
  protocol           = "${var.protocol}"
  vpc_id             = "${var.vpc_id}"
  #target_id          = "${module.ec2.instance_id}"
  instance_id        = "${module.ec2.instance_id}"
  field              = "${var.field}"
  value              = "${var.value}"  
  #sg_id_alb          = "${module.securitygroup.sg_id_alb}"
}

