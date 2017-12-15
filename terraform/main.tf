provider "aws" {
  region = "${var.aws_region}"  
}

data "template_file" "user_data" {
  template = "${file("${path.module}/${var.user_data}")}"
}

resource "aws_launch_configuration" "web-lc" {
  name                 = "web_lc"
  image_id             = "${var.ami_id}"
  instance_type        = "t2.micro"
  iam_instance_profile = "${var.iam_role}"
  user_data            = "${data.template_file.user_data.rendered}"
  key_name             = "rhel"

  root_block_device {
    volume_type = "gp2"
    volume_size = "50"
  }
}

resource "aws_autoscaling_group" "web-asg" {
  name                 = "web_asg"
  launch_configuration = "${aws_launch_configuration.web-lc.name}"
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  vpc_zone_identifier  = ["subnet-8e66c5a1"]

  lifecycle {
    create_before_destroy = true
  }
}
