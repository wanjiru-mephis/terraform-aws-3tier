data "aws_ami" "amazon_linux_2023" {
  most_recent      = true # Always picks the latest matching AMI
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-minimal-*-arm64"]
  }
  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}