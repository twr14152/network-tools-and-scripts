Working with restconf on ceos-lab device curl is useful for determing which url is working on the device. The response type to a command is much faster with curl than it is using python requests and its a more direct means of getting info


curl_script1.sh - This script will tell you what urls are exposed / registered on the device based on the reponse code (200/Good 400/Bad). 
```
(lab_env) todd@todd-TOSHIBA-DX735:~/Code_folder/containerlab/containerlabs_sandbox/ceos_lab/lab3/scripts/restconf_stuff$ ./curl_script1.sh 
interfaces:interfaces
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:46 GMT

sytem:system
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:46 GMT

platform:components
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:46 GMT

routing
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:47 GMT

bgp
HTTP/1.1 404 Not Found
Content-Type: text/plain; charset=utf-8
X-Content-Type-Options: nosniff
Date: Mon, 03 Nov 2025 14:12:47 GMT
Content-Length: 10

routing again
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:47 GMT

ietf-interfaces
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:48 GMT

system-info
HTTP/1.1 200 OK
Content-Type: application/yang.data+json
Date: Mon, 03 Nov 2025 14:12:48 GMT

(lab_env) todd@todd-TOSHIBA-DX735:~/Code_folder/containerlab/containerlabs_sandbox/ceos_lab/lab3/scripts/restconf_stuff$ 

```

curl_script2.sh - You can run it as a script to get an idea of what these outputs look like. Or run them indiviually from command line. 

```
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  "https://clab-lab3-ceos1:6020/restconf/data/openconfig-interfaces:interfaces/interface=Ethernet2/state"
interfaces:interfaces
{"openconfig-interfaces:admin-status":"UP","openconfig-interfaces:counters":{"carrier-transitions":"2","in-broadcast-pkts":"5","in-discards":"0","in-errors":"0","in-fcs-errors":"0","in-multicast-pkts":"5794","in-octets":"764815","in-pkts":"5811","in-unicast-pkts":"12","out-broadcast-pkts":"0","out-discards":"0","out-errors":"0","out-multicast-pkts":"0","out-octets":"0","out-pkts":"0","out-unicast-pkts":"0"},"openconfig-interfaces:description":"to ceos3","openconfig-platform-port:hardware-port":"Ethernet2-Port","openconfig-interfaces:ifindex":2,"arista-intf-augments:inactive":false,"openconfig-interfaces:last-change":"1762136595449660301","openconfig-interfaces:management":false,"openconfig-interfaces:mtu":0,"openconfig-interfaces:name":"Ethernet2","openconfig-interfaces:oper-status":"UP","openconfig-platform-transceiver:transceiver":"Ethernet2","openconfig-interfaces:type":"iana-if-type:ethernetCsmacd"}
```
