data "alicloud_zones" "default" {
  available_resource_creation = "KVStore"
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id        = data.alicloud_zones.default.zones.0.id
  engine         = "Redis"
  engine_version = var.redis_engine_version
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "example" {
  source = "../.."

  #alicloud_ons_instance
  ons_instance_name   = var.ons_instance_name
  ons_instance_remark = var.ons_instance_remark

  #alicloud_ons_topic
  topic            = "tf-topic-name"
  message_type     = 0
  ons_topic_remark = "tf-topic-remark"
  ons_topic_perm   = var.ons_topic_perm

  #alicloud_kvstore_instance
  redis_instance_name          = var.redis_instance_name
  redis_instance_class         = data.alicloud_kvstore_instance_classes.default.instance_classes.0
  zone_id                      = data.alicloud_zones.default.zones.0.id
  vswitch_id                   = module.vpc.this_vswitch_ids[0]
  security_ips                 = var.security_ips
  redis_instance_type          = "Redis"
  redis_engine_version         = var.redis_engine_version
  redis_appendonly             = var.redis_appendonly
  redis_lazyfree-lazy-eviction = var.redis_lazyfree-lazy-eviction
  redis_tags_created           = var.redis_tags_created
  redis_tags_for               = var.redis_tags_for

}