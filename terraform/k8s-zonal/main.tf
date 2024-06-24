terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    skip_region_validation      = "true"
    skip_credentials_validation = "true"
  }
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.122.0"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone_name
}
