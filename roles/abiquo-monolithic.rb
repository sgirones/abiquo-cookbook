name "abiquo-monolithic"
description "The base role for an Abiquo Monolithic server"
# The order is important here
run_list "role[abiquo-v2v]","role[abiquo-remote-services]","role[abiquo-server]"

override_attributes(
  "repo" => {
    "abiquo-ee" => {
      "url" => "http://mirror.bcn.abiquo.com/2.0-rolling/",
      "key" => "RPM-GPG-KEY-Abiquo"
    },
    "abiquo" => {
      "url" => "http://mirror.abiquo.com/abiquo/2.0/os/x86_64",
      "key" => "RPM-GPG-KEY-Abiquo"
    }
  },
  :abiquo => {
    :properties => {
      :server => {
        "abiquo.auth.module" => "abiquo",
        "abiquo.server.heartbeatAddress" => "https://heartbeat.abiquo.com/heartbeat-server",
        "abiquo.server.sessionTimeout" => "60",
        "abiquo.server.mail.user" => "none@none.es",
        "abiquo.server.mail.server" => "127.0.0.1",
        "abiquo.server.mail.password" => "none"
      },
      :global => {
        "abiquo.rabbitmq.username" => "guest",
        "abiquo.rabbitmq.password" => "guest",
        "abiquo.rabbitmq.port" => "5672",
        "abiquo.rabbitmq.host" => "127.0.0.1"
      },
      :rs => {
        "abiquo.redis.host" => "127.0.0.1",
        "abiquo.storagemanager.netapp.password" => "user",
        "abiquo.virtualfactory.xenserver.repositoryLocation" => "127.0.0.1:/opt/vm_repository",
        "abiquo.dvs.enabled" => "false",
        "abiquo.virtualfactory.storagelink.address" => "https://127.0.0.1:21605",
        "abiquo.redis.port" => "6379",
        "abiquo.appliancemanager.localRepositoryPath" => "/opt/vm_repository",
        "abiquo.virtualfactory.vmware.repositoryLocation" => "127.0.0.1:/opt/vm_repository",
        "abiquo.storagemanager.netapp.user" => "user",
        "abiquo.virtualfactory.hyperv.repositoryLocation" => "127.0.0.1:/opt/vm_repository",
        "abiquo.appliancemanager.repositoryLocation" => "127.0.0.1:/opt/vm_repository",
        "abiquo.virtualfactory.storagelink.user" => "admin",
        "abiquo.dvs.vcenter.user" => "Administrator",
        "abiquo.virtualfactory.storagelink.password" => "storagelink",
        "abiquo.dvs.vcenter.password" => "secret"
      }
    }
    
  }
)
