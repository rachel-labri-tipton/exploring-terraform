variable "region" {
  default = "eu-west-1"
}

variable "zone1" {
  default = "eu-west-1a"
}

variable "amiID" {
  type = map(any)
  default = {
    eu-west-1 = "ami-0c55b159cbfafe1f0"
    eu-west-2 = "ami-0a313d6098716f372"
    eu-west-3 = "ami-0c55b159cbfafe1f0"
  }


}