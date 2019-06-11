# EC2

resource "aws_instance" "this" {
  ami                     = "${var.ami_id}"
  # vpc                     = "${var.vpc_id}"
  subnet_id               = "${var.ec2_subnet_id}"
  instance_type           = "${var.instance_type}"
  vpc_security_group_ids  = ["${var.sg_id_ec2}"]
 # ebs_optimized           = "false"
  associate_public_ip_address = "true"
  key_name                = "${var.key_name}" 
  tags                    = "${merge(map("Name", "${var.name}"), var.tags)}"
  volume_tags             = "${merge(map("Name", "${var.name}"), var.tags)}"
  #disable_api_termination = "${var.data_protection}"
  #user_data               = "${var.user_data}"

  root_block_device {
    volume_size           = "${var.volume_size}"
    #delete_on_termination = "${var.data_protection ? false : true}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.key_name}"
  public_key = "xxxxxxxxxxxxENTER YOUR SYSTEM PUBLIC KEY HERExxxxxxxxxxxxxxxxx"
}

