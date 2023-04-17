resource "aws_lb" "tf-lb" {
  name               = "${var.vpc-name}-lb"
  load_balancer_type = "application"
  security_groups = [var.security-group]
  subnets = [ var.aws_subnet-1, var.aws_subnet-2,var.aws_subnet-3 ]
  tags = {
    Name = "${var.vpc-name}-lb"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tf-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Page not found :("
      status_code = 404
    }
  }
}

resource "aws_lb_target_group" "asg-tg" {
  name_prefix = "asg-tg"
  port = 80
  protocol = "HTTP"
  vpc_id      = var.vpc-id
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    interval = 30
    timeout = 5
    path = "/"
    protocol = "HTTP"
    matcher = "200"
  }
}

resource "aws_lb_listener_rule" "asg-listen" {
  listener_arn = aws_lb_listener.http.arn
  priority = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.asg-tg.arn
  }
}

resource "aws_launch_configuration" "ec2cluster" {
	image_id = "ami-0b2bed38d5cd22d50"
	instance_type = "t2.micro"
 	security_groups = [var.security-group]
	user_data = file("user-data.sh")
	lifecycle {
	  create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "asg" {
  name = "${var.vpc-name}-asg"
	launch_configuration = aws_launch_configuration.ec2cluster.name
	vpc_zone_identifier = [var.aws_subnet-1, var.aws_subnet-2, var.aws_subnet-3]
	target_group_arns = [aws_lb_target_group.asg-tg.arn]
	health_check_type = "ELB"
	min_size = 2
  desired_capacity = 3
	max_size = 6
	tag {
	  key = "Name"
	  value = "${var.vpc-name}-asg"
	  propagate_at_launch = true
	}
}