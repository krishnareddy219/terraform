resource "aws_lb" "jagadeesh" {
  name               = "jagadeesh"
 
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ramya.id]
  subnets            =  [module.vpc.public_subnets[0],module.vpc.public_subnets[1]]
  
  tags = {
    Name = "jagadeesh"
  }
} 

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.jagadeesh.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
