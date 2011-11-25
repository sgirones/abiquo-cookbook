name "abiquo-remote-services"
description "The base role for an Abiquo Remote Services host"
run_list "role[abiquo-host]", "recipe[abiquo::remote-services]"

override_attributes(
  :abiquo => {
    :properties => {
      :global => {
        "abiquo.rabbitmq.username" => "guest",
        "abiquo.rabbitmq.password" => "guest",
        "abiquo.rabbitmq.port" => "5672",
        "abiquo.rabbitmq.host" => "127.0.0.1"
      },
      :rs => {
        "abiquo.redis.host" => "127.0.0.1",
        "abiquo.storagemanager.netapp.password" => "user",
        "abiquo.virtualfactory.xenserver.repositoryLocation" => "10.10.10.1:/opt/vm_repository",
        "abiquo.dvs.enabled" => "false",
        "abiquo.virtualfactory.storagelink.address" => "https://127.0.0.1:21605",
        "abiquo.redis.port" => "6379",
        "abiquo.appliancemanager.localRepositoryPath" => "/opt/vm_repository",
        "abiquo.virtualfactory.vmware.repositoryLocation" => "10.10.10.1:/opt/vm_repository",
        "abiquo.storagemanager.netapp.user" => "user",
        "abiquo.virtualfactory.hyperv.repositoryLocation" => "10.10.10.1:/opt/vm_repository",
        "abiquo.appliancemanager.repositoryLocation" => "10.10.10.1:/opt/vm_repository",
        "abiquo.virtualfactory.storagelink.user" => "admin",
        "abiquo.dvs.vcenter.user" => "Administrator",
        "abiquo.virtualfactory.storagelink.password" => "storagelink",
        "abiquo.dvs.vcenter.password" => "secret"
      }
    }
    
  }
)
