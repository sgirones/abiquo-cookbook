name "abiquo-monolithic"
description "The base role for an Abiquo Monolithic server"
# The order is important here
run_list "role[abiquo-v2v]","role[abiquo-remote-services]","role[abiquo-server]"

