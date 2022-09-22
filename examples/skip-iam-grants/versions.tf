terraform {
  required_version = ">= 0.15.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "= 4.36.0"
    }
    lacework = {
      source  = "lacework/lacework"
      version = ">= 0.26.1"
    }
  }
}


