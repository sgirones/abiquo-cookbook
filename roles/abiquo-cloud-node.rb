name "abiquo-cloud-node"

default_attributes "abiquo" => {
  "cloud_node" => {
    "redis_host" => "10.240.43.194",
    "remote_repository_url" => "10.240.43.194:/opt/vm_repository",
    "mount_remote_repository" => true,
    "local_repository_path" => "/opt/vm_repository",
    "reboot_after_deploy" => true,
    "remote_repository_fstype" => "nfs"
  }
}

