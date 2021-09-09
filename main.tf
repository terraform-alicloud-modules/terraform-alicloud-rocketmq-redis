resource "alicloud_ons_instance" "default" {
  instance_name = var.ons_instance_name
  remark        = var.ons_instance_remark
}

resource "alicloud_ons_topic" "default" {
  topic_name   = var.topic
  instance_id  = alicloud_ons_instance.default.id
  message_type = 0
  remark       = var.ons_topic_remark
}

resource "alicloud_kvstore_instance" "default" {
  db_instance_name = var.redis_instance_name
  vswitch_id       = var.vswitch_id
  security_ips     = var.security_ips
  instance_type    = var.redis_instance_type
  engine_version   = var.redis_engine_version
  config           = {
    appendonly             = var.redis_appendonly
    lazyfree-lazy-eviction = var.redis_lazyfree-lazy-eviction
  }
  tags             = {
    Created = var.redis_tags_created,For = var.redis_tags_for,
  }
  zone_id          = var.zone_id
  instance_class   = var.redis_instance_class
}
