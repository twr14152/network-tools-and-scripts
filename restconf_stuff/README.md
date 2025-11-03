Working with restconf on ceos-lab device curl is useful for determing which url is working on the device. The response type to a command is much faster with curl than it is using python requests and its a more direct means of getting info

curl_script1.sh
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
