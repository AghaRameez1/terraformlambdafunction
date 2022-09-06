terraform {
  backend "s3"{
    bucket = "rameez-test-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}