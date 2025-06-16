include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/aws/compute"
}

inputs = {
  aws_region = "us-east-1"
  environment = "prod"
  availability_zone = "us-east-1a"
  instance_type = "t3.micro"
  ami_id = "ami-09e6f87a47903347c"

  common_tags = {
    Environment = "prod"
    Project    = "my-project"
  }
}
