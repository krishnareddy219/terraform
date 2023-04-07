variable "region" {
    type = string
  
}
variable "cidr_block" {
    type = string
  
}
variable "tags_name" {
   type = string 
}
variable "cidr_subnets" {
  type = list(string) 
}

variable "tag_subnet_name" {
  type = list(string)
}