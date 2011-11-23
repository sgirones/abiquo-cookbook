name "abiquo-server"
description "The base role for an Abiquo Server host"
run_list "recipe[abiquo::server]","role[abiquo-host]"
override_attributes(
  :abiquo => {
    :properties => {
      :global => {
        "abiquo.rabbitmq.username" => "guest",
        "abiquo.rabbitmq.password" => "guest",
        "abiquo.rabbitmq.port" => "5672",
        "abiquo.rabbitmq.host" => "127.0.0.1"
      },
      :server => {
        "abiquo.auth.module" => "abiquo",
        "abiquo.server.heartbeatAddress" => "https://heartbeat.abiquo.com/heartbeat-server",
        "abiquo.server.sessionTimeout" => "60",
        "abiquo.server.mail.user" => "none@none.es",
        "abiquo.server.mail.server" => "127.0.0.1",
        "abiquo.server.mail.password" => "none"
      }
    }
  }
)
