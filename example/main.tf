data "alicloud_zones" "default" {
  available_resource_creation = "KVStore"
  enable_details              = true
}

resource "alicloud_vpc" "default" {
  vpc_name   = "terraform_test"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = "terraform_test"
  cidr_block   = "172.16.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}


module "example" {
  source     = "../"
  vswitch_id = alicloud_vswitch.default.id
}
