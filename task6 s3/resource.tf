resource "aws_s3_bucket" "b" {
  bucket = "gkgaaru"

  tags = {
    Name        = "gkreddy"
    Environment = "Dev"
  }
}
