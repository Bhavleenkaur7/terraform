
resource "aws_lb_target_group" "this" {
  name        = "${var.name}"
  port        = "${var.port}"
  protocol    = "${var.protocol}"
  target_type = "instance"
  vpc_id      = "${var.vpc_id}"
  

  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = "${aws_lb_target_group.this.arn}"
 
  target_id        = "${var.instance_id}"
  port             = "${var.port}"
}

resource "aws_lb_listener_rule" "static"{
  listener_arn = "${var.arn}"
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.this.arn}"
  }

  condition {
    field  = "${var.field}"
    values = ["${var.value}"]
  }

}



