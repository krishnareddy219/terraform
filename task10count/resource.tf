resource "aws_vpc" "lakshmi" {
  cidr_block = var.cidr_block
  tags = {
    Name = "lakshmi"
  }

}
resource "aws_subnet" "subnets" {
  count      = length(var.cidr_subnets)
  vpc_id     = aws_vpc.lakshmi.id
  cidr_block = var.cidr_subnets[count.index]

  tags = {
    Name = var.tag_subnet_name[count.index]
  }
}
