### Curl
Working with restconf on ceos-lab device curl is useful for determing which url is working on the device. The response type to a command is much faster with curl than it is using python requests and its a more direct means of getting info.


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
# containerlab standard login creds
curl -k -u admin:admin \
  -H "Accept: application/yang-data+json" \
  "https://clab-lab3-ceos1:6020/restconf/data/openconfig-interfaces:interfaces/interface=Ethernet2/state"
interfaces:interfaces
{"openconfig-interfaces:admin-status":"UP","openconfig-interfaces:counters":{"carrier-transitions":"2","in-broadcast-pkts":"5","in-discards":"0","in-errors":"0","in-fcs-errors":"0","in-multicast-pkts":"5794","in-octets":"764815","in-pkts":"5811","in-unicast-pkts":"12","out-broadcast-pkts":"0","out-discards":"0","out-errors":"0","out-multicast-pkts":"0","out-octets":"0","out-pkts":"0","out-unicast-pkts":"0"},"openconfig-interfaces:description":"to ceos3","openconfig-platform-port:hardware-port":"Ethernet2-Port","openconfig-interfaces:ifindex":2,"arista-intf-augments:inactive":false,"openconfig-interfaces:last-change":"1762136595449660301","openconfig-interfaces:management":false,"openconfig-interfaces:mtu":0,"openconfig-interfaces:name":"Ethernet2","openconfig-interfaces:oper-status":"UP","openconfig-platform-transceiver:transceiver":"Ethernet2","openconfig-interfaces:type":"iana-if-type:ethernetCsmacd"}
```
use -v with curls to see each step of the way
```
# containerlab standard login creds
curl -k -v -u admin:admin \
  -H "Accept: application/yang-data+json" \
  "https://clab-lab3-ceos1:6020/restconf/data/openconfig-interfaces:interfaces/interface=Ethernet2/state"
* Host clab-lab3-ceos1:6020 was resolved.
* IPv6: 3fff:172:20:20::6
* IPv4: 172.20.20.6
*   Trying [3fff:172:20:20::6]:6020...
*   Trying 172.20.20.6:6020...
* Connected to clab-lab3-ceos1 (172.20.20.6) port 6020
* ALPN: curl offers h2,http/1.1
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256 / X25519 / RSASSA-PSS
* ALPN: server accepted http/1.1
* Server certificate:
*  subject: CN=lab
*  start date: Oct  3 12:19:24 2025 GMT
*  expire date: Dec 20 12:19:24 2033 GMT
*  issuer: CN=lab
*  SSL certificate verify result: self-signed certificate (18), continuing anyway.
*   Certificate level 0: Public key type RSA (2048/112 Bits/secBits), signed using sha256WithRSAEncryption
* using HTTP/1.x
* Server auth using Basic with user 'admin'
> GET /restconf/data/openconfig-interfaces:interfaces/interface=Ethernet2/state HTTP/1.1
> Host: clab-lab3-ceos1:6020
> Authorization: Basic YWRtaW46YWRtaW4=
> User-Agent: curl/8.5.0
> Accept: application/yang-data+json
> 
* TLSv1.3 (IN), TLS handshake, Newsession Ticket (4):
< HTTP/1.1 200 OK
< Content-Type: application/yang.data+json
< Etag: "516253bb0ee90cabcd1003c533b69999de"
< Date: Mon, 03 Nov 2025 14:59:04 GMT
< Content-Length: 917
< 
{"openconfig-interfaces:admin-status":"UP","openconfig-interfaces:counters":{"carrier-transitions":"2","in-broadcast-pkts":"5","in-discards":"0","in-errors":"0","in-fcs-errors":"0","in-multicast-pkts":"6152","in-octets":"812083","in-pkts":"6169","in-unicast-pkts":"12","out-broadcast-pkts":"0","out-discards":"0","out-errors":"0","out-multicast-pkts":"0","out-octets":"0","out-pkts":"0","out-unicast-pkts":"0"},"openconfig-interfaces:description":"to ceos3","openconfig-platform-port:hardware-port":"Ethernet2-Port","openconfig-interfaces:ifindex":2,"arista-intf-augments:inactive":false,"openconfig-interfaces:last-change":"1762136595449660301","openconfig-interfaces:management":false,"openconfig-interfaces:mtu":0,"openconfig-interfaces:name":"Ethernet2","openconfig-interfaces:oper-status":"UP","openconfig-platform-transceiver:transceiver":"Ethernet2","openconfig-interfaces:type":"iana-if-type:ethernetCsmacd"}
* Connection #0 to host clab-lab3-ceos1 left intact
(lab_env) todd@todd-TOSHIBA-DX735:~/Code_folder/containerlab/containerlabs_sandbox/ceos_lab/lab3/scripts/restconf_stuff$ 

```
