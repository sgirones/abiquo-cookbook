name "abiquo-xen"
description "The role for an Abiquo Xen cloud node"
run_list "role[abiquo-host]", "recipe[abiquo::xen]"

override_attributes(
  "abiquo" => {
    "aim" => {
      "redis_host" => "127.0.0.1",
      "qemu_uri" => "xen+unix:///system"
    },
  }
)

