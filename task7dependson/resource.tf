resource "aws_vpc" "ramya" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "ramya"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.ramya.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet1"
  }
  depends_on = [
    aws_vpc.ramya
  ]
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.ramya.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet2"
  }
  depends_on = [
    aws_subnet.subnet1
  ]
}
