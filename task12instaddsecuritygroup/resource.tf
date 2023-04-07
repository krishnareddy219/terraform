resource "aws_instance" "reddy" {
ami = "ami-03f4fa076d2981b45"
instance_type = "t2.micro"
key_name = "reddy"
 security_groups = ["siri"]
 tags ={
    Name = "lakshmi"
 }

}