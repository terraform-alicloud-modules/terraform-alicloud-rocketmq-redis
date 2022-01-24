#alicloud_ons_instance
variable "ons_instance_name" {
  description = "The specification of ons instance name."
  type        = string
  default     = "tf-ons-instance-name"
}

variable "ons_instance_remark" {
  description = "The specification of ons instance remark."
  type        = string
  default     = "tf-ons-instance-remark"
}

#alicloud_ons_topic
variable "ons_topic_perm" {
  description = "This attribute is used to set the read-write mode for the topic."
  type        = number
  default     = "2"
}

#alicloud_kvstore_instance
variable "redis_instance_name" {
  description = "The specification of the redis instance name."
  type        = string
  default     = "tf-redis-instance-name"
}

variable "security_ips" {
  description = "The specification of the security ips."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "redis_engine_version" {
  description = "The specification of the redis engine version."
  type        = string
  default     = "4.0"
}

variable "redis_appendonly" {
  description = "The specification of the redis is append only."
  type        = string
  default     = "yes"
}

variable "redis_lazyfree-lazy-eviction" {
  description = "The specification of the redis lazy eviction."
  type        = string
  default     = "yes"
}

variable "redis_tags_created" {
  description = "The specification of the redis tags Created value."
  type        = string
  default     = "tf-module"
}

variable "redis_tags_for" {
  description = "The specification of the redis tags For value."
  type        = string
  default     = "tf-tags"
}