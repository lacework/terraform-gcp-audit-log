terraform {
  required_version = ">= 0.12.31"

  required_providers {
    google = ">= 3.0.0, < 5.0.0"
    time   = "~> 0.6"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.2"
    }
  }
}
