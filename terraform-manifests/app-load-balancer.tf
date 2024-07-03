
#create application load balancer
resource "aws_lb" "akshay-test-alb" {
  name               = "akshay-application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_vpn_traffic_for_alb.id]
  subnets            = [aws_subnet.public-subnet-1a.id]

  tags = {
    "Name" = "my-alb"
  }
}

# Define ALB Target Group
resource "aws_lb_target_group" "my_target_group" {
  name     = "akshay-alb-test-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.akshay-vpc.id

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    "Name" = "my-target-group"
  }
}

# Register private-instance-1 with ALB Target Group
resource "aws_lb_target_group_attachment" "instance-attachments-1" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.private-instance-1.id
  port             = 80
}

# Register private-instance-2 with ALB Target Group
resource "aws_lb_target_group_attachment" "instance-attachments-2" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = aws_instance.private-instance-2.id
  port             = 80
}

# Configure ALB Listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.akshay-test-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

