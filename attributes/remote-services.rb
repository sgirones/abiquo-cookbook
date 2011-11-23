default['abiquo']['reboot_after_deploy'] = false

# Global properties (both RS and Servers needs them)
default['abiquo']['properties']['global']['abiquo.rabbitmq.username'] = 'guest'
default['abiquo']['properties']['global']['abiquo.rabbitmq.password'] = 'guest'
default['abiquo']['properties']['global']['abiquo.rabbitmq.port'] = '5672'
default['abiquo']['properties']['global']['abiquo.rabbitmq.host'] = '127.0.0.1'


## RS Properties
default['abiquo']['properties']['rs']['abiquo.redis.host'] = '127.0.0.1'
default['abiquo']['properties']['rs']['abiquo.storagemanager.netapp.password'] = 'user'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.xenserver.repositoryLocation'] = '10.60.20.33:/volume1/mothership-nfs'
default['abiquo']['properties']['rs']['abiquo.dvs.enabled'] = 'false'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.storagelink.address'] = 'https://127.0.0.1:21605'
default['abiquo']['properties']['rs']['abiquo.redis.port'] = '6379'
default['abiquo']['properties']['rs']['abiquo.appliancemanager.localRepositoryPath'] = '/opt/vm_repository'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.vmware.repositoryLocation'] = '10.60.20.33:/volume1/mothership-nfs'
default['abiquo']['properties']['rs']['abiquo.storagemanager.netapp.user'] = 'user'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.hyperv.repositoryLocation'] = '10.60.20.33:/volume1/mothership-nfs'
default['abiquo']['properties']['rs']['abiquo.appliancemanager.repositoryLocation'] = '10.60.20.33:/volume1/mothership-nfs'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.storagelink.user'] = 'admin'
default['abiquo']['properties']['rs']['abiquo.dvs.vcenter.user'] = 'Administrator'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.storagelink.password'] = 'storagelink'
default['abiquo']['properties']['rs']['abiquo.dvs.vcenter.password'] = 'abiqu0!'
default['abiquo']['properties']['rs']['abiquo.virtualfactory.kvm.fullVirt'] = 'true'
