resource "aws_security_group" "gk" {


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "http"
  }

  tags = {
    Name = "kiran"
  }
}