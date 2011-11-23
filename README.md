# Author:: Sergio Rubio (<srubio@abiquo.com>)

# QUICK START

Add all the roles in the roles folder to your Chef Server.

Required cookbooks: yum, selinux

# AVAILABLE RECIPES

## abiquo::base

Required by every Abiquo recipe.

## abiquo::kvm

Installs a KVM Cloud Node

## abiquo::server

Install the Abiquo Server

## abiquo::remote-services

Install the Abiquo Remote Services

## abiquo::v2v

Install the Abiquo V2V Services

## abiquo::nfs-repository

Creates an NFS repository required by Abiquo Remote Services and Abiquo V2V

# Combined Installs

## Monolithic installations

Monolithic installations install Abiquo Server, Remote Services and V2V Services in the same box.

To deploy a Monolithic installation add the abiquo::server, abiquo::remote-services and abiquo::v2v recipes to the run_list of the node.

## Remote Services + V2V

Remote Services + V2V installation installs Abiquo Remote Services and V2V Services in the same box. This installation type is typically required when managing remote datacenters from a central (Abiquo Server) location.

To deploy a this kind of node add the abiquo::remote-services and abiquo::v2v recipes to the run_list of the node.

# ROLES

## abiquo-host

It contains the Abiquo YUM repository configuration for both community and enterprise repositories.

Required by every Abiquo host (Server,RS,V2V,Cloud Nodes). Add this role to every node using the Abiquo cookbook.


# DESCRIPTION

Install Abiquo Platform (http://www.abiquo.com)
