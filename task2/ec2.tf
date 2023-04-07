resource "aws_instance" "gk" {
  ami = "ami-03f4fa076d2981b45"
  instance_type = "t2.micro"
  tags = {
    Name ="gk"
  }
}
