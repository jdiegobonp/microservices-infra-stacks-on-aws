identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  variables = {
    name = "micro"
    cidr_block = "10.0.0.0/16"
  }
}