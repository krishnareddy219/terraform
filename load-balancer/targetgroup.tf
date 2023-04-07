resource "aws_lb_target_group" "target" {
  name     = "target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.krishna.id
}
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.nag.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.nag1.id
  port             = 80
}
