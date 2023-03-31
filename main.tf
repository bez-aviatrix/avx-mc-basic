terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "3.0.0"
    }
  }
}

provider "aviatrix" {
    skip_version_validation = true
}

module "t" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.4.0"

  name        = "${var.name}-tx-1"
  cloud       = var.cloud
  region      = var.region
  cidr        = cidrsubnet(var.cidr, 3, 1)
  account     = var.account
  ha_gw       = var.ha
}

module "s" {
  source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version = "1.5.0"

  cloud       = var.cloud
  name        = "${var.name}-spk-1"
  cidr        = cidrsubnet(var.cidr, 3, 4)
  region      = var.region
  account     = var.account
  transit_gw  = module.t.transit_gateway.gw_name
  ha_gw       = var.ha
}