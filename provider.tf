provider "aws" {
  region = "us-east-1"
  profile = "accuknox"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
  profile = "accuknox"
}