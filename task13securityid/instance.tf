resource "aws_instance" "narendra" {
    ami = "ami-03f4fa076d2981b45"
    instance_type = "t2.micro"
    key_name = "reddy"
    vpc_security_group_ids = ["${aws_security_group.narendra.id}"]
    tags = {
      Name = "narendra"
    }
}