resource "aws_instance" "siri" {
  ami           = "ami-06984ea821ac0a879"
  instance_type = "t2.micro"
  key_name = "reddyimport"
  tags = {
    Name = "reddyimport"
  }
}
