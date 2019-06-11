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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDV2x63e68lnWSFDuEuSxpjsiYrwPBBVH7kwmM0q/Fm2/6Ydi6LlCPhZG/v2s3tHVnorrFSTGj4bOztdAWpwY6Tj/JmYskGnR03DftI1Q7wp2GVxEzDExE9bJMdJlX9anaxC0JUXA4eoX/bGItyAolLssQuuQzy2ggUS2KiFDD7YjibauQV+Vv7yvV8CHpJYmWVRpk/XRWRsE+p/NrncKoJLBkUBLBbSX0Di9eu0tjkGF0PvYs7/kGEPS7D98g2QVA/7KHhGZFAS+HW35GrTMLDo7DaQqyptyE9y0QIP2XTCcuB/uh9DzOCNOq4fj+PYJbyr6ZfX92PmJTsTa7u0KlXiYjoxIy5POSby98HaTBXoRqnlNepXgL1on2JIqlDJIYDfy+JAOw9bTvKiYgIo52tiikZU0ZR8KpianeRtBXZIrj0AntnxwnCwWBQLmXOkhX7tPQxRTDxxMt1A2KIZr5qpYzVFnkuezQfAMK6SPJr3EBxTDI+uhWuZ3c6WtAaqecCULXNcAvztRoZwnjsRNMNRbos6Xzf0luhktn5iiv4qgQtd1ylPNm/RDS6PmPtaZI7MYORiUs3vvg/CXa/1d8i4eYWA05OrnuaBgO+m61CFaxqLRwqgPTshKswP88Upew6Zb6g4ufmurL9ZbqiTSK3oICH+iZ0uUyUWsf0vsYZiw=="
}

