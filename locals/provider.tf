terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "cloudmine-tf-remotestate" # Replace with your S3 bucket name
    key            = "locals-demo-tfstate" # Desired path within the bucket. Same key file should not be used by multiple users
    region         = "us-east-1"                 # Replace with your AWS region
    encrypt        = true
    use_lockfile = true

}

}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}