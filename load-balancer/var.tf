variable "subnets_cidr" {
  type = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24"]

}
variable "availability_zone" {
  type = list(string)
  default = ["ap-northeast-1a","ap-northeast-1d"]

}