# This all you need to start with Terraformer to extract Okta resource from your Okta tenant.
terraform {
  required_providers {
    okta = {
      source  = "okta/okta",
      version = "~> 3.13"
    }
  }
}

provider "okta" {
}