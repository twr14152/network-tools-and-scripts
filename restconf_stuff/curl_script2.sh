#!/bin/bash

echo "interfaces:interfaces"
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  "https://clab-lab3-ceos1:6020/restconf/data/openconfig-interfaces:interfaces/interface=Ethernet2/state"

echo "sytem:system"
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  https://clab-lab3-ceos1:6020/restconf/data/openconfig-system:system \

echo "platform:components"
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  https://clab-lab3-ceos1:6020/restconf/data/openconfig-platform:components \


echo "routing"
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  https://clab-lab3-ceos1:6020/restconf/data/openconfig-network-instances:network-instances

#not working
echo "bgp"
curl -k -u admin:admin \
	-H "Accept: application/yang-data+json" \
	https://clab-lab3-ceos1:6020/restconf/data/openconfig-bgp:bgp 

echo "routing again"
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  "https://clab-lab3-ceos1:6020/restconf/data/openconfig-network-instances:network-instances/network-instance=default/protocols"


echo "ietf-interfaces"
curl -k -u admin:admin \
	-H "Accept: application/yang-data+json" \
	https://clab-lab3-ceos1:6020/restconf/data/ietf-interfaces:interfaces

echo "system-info"
curl -k -u admin:admin \
	-H "Accept: application/yang-data+json" \
	https://clab-lab3-ceos1:6020/restconf/data/ietf-system:system
