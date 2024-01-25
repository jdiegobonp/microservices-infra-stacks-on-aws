variable "name" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "regions" {
  type = list(string)
  default = ["us-east-1"]
}