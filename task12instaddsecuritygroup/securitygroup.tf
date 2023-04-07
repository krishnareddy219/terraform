resource "aws_security_group" "siri" {
  name = "siri"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

}