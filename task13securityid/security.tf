resource "aws_security_group" "narendra" {
  name = "narendra"
     
ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
     }
}