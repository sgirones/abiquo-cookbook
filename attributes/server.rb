default['abiquo']['reboot_after_deploy'] = false

# Global properties (both RS and Servers needs them)
default['abiquo']['properties']['global']['abiquo.rabbitmq.username'] = 'guest'
default['abiquo']['properties']['global']['abiquo.rabbitmq.password'] = 'guest'
default['abiquo']['properties']['global']['abiquo.rabbitmq.port'] = '5672'
default['abiquo']['properties']['global']['abiquo.rabbitmq.host'] = '127.0.0.1'

# Server properties
default['abiquo']['properties']['server']['abiquo.auth.module'] = 'abiquo'
default['abiquo']['properties']['server']['abiquo.server.heartbeatAddress'] = 'https://heartbeat.abiquo.com/heartbeat-server'
default['abiquo']['properties']['server']['abiquo.server.sessionTimeout'] = '60'
default['abiquo']['properties']['server']['abiquo.server.mail.user'] = 'none@none.es'
default['abiquo']['properties']['server']['abiquo.server.mail.server'] = '127.0.0.1'
default['abiquo']['properties']['server']['abiquo.server.mail.password'] = 'none'
