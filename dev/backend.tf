terraform{
    backend "s3" {
    bucket         = "uthman-terraform-bucket" 
    key            = "dev/terraform.tfstate"  
    region         = "eu-west-2"              
  }
}