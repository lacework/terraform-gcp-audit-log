terraform {
  required_version = ">= 0.12.0"

  required_providers {
    google = "~> 3.0"
    time   = "~> 0.6"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.2"
    }
  }
}
