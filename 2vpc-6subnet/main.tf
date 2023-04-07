resource "aws_vpc" "lucky" {
  cidr_block = var.vpc_cidr[count.index]
  count      = 2

  tags = {
    Name = var.vpc_tag[count.index]
  }
}
resource "aws_subnet" "Name" {
  vpc_id     = aws_vpc.lucky[0].id
  cidr_block = var.subnets_cidr[count.index]
  count      = 6

}
resource "aws_subnet" "poorna" {
  vpc_id     = aws_vpc.lucky[1].id
  cidr_block = var.subnets1_cidr[count.index]
  count      = 6

}