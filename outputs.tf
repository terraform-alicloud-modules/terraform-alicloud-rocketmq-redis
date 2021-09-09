output "this_alicloud_ons_instance_id" {
  value = alicloud_ons_instance.default.id
}

output "this_alicloud_ons_topic_id" {
  value = alicloud_ons_topic.default.id
}

output "this_redis_instance_id" {
  value = alicloud_kvstore_instance.default.id
}
output "this_vswitch_id" {
  value = alicloud_kvstore_instance.default.vswitch_id
}
