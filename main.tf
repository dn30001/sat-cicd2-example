 terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  credentials = "bionic-flux-414109-6a39dd7bbe43.json"
    project = var.project
  region = var.region
}




# This is the bucket for your state files
resource "google_storage_bucket" "raw3" {
  project = var.project
  name = "${var.data_project}-raw3"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}


locals {
    labels = {
        "data-project" = var.data_project
    }
}

variable "project" {
    type= string
    default = "bionic-flux-414109"
    description = "ID Google project"
}

variable "region" {
    type= string
    default = "us-central1"
    description = "Region Google project"
}

variable  "data_project" {
    type = string
    default = "mysat2_cicd_project"
    description = "Name of data pipeline project to use as resource prefix"
}
