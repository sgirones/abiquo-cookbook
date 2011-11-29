name "abiquo-kvm"
description "The role for an Abiquo KVM cloud node"
run_list "role[abiquo-host]", "recipe[abiquo::kvm]"

override_attributes(
  "abiquo" => {
    "aim" => {
      "redis_host" => "127.0.0.1",
      "qemu_uri" => "qemu+unix:///system"
    },
  }
)

