resource "aws_lb" "lucky" {
  name               = "lucky"
 
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ramya.id]
  subnets            =  [aws_subnet.sara[0].id,aws_subnet.sara[1].id]
  
  tags = {
    Name = "jagadeesh"
  }
} 

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lucky.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
resource "aws_lb_listener" "front" {
  load_balancer_arn = aws_lb.lucky.arn
  port              = "80"
  protocol          = "HTTP"
  


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}

#[aws_subnet.sara[0],aws_subnet.sara[1]]