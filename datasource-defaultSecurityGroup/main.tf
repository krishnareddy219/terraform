# AWS:
# a. Create a Security group in default vpc.
# b. Use Datasource to get default vpc

data "aws_vpc" "ramya" {
  id = var.vpc_id
}
resource "aws_security_group" "bharath" {
  name        = "bharath"
  vpc_id      = data.aws_vpc.ramya.id

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }
}