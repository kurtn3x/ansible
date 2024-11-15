# wireguard server

## Setup for simple server

- set variables & deploy role

## Setup for router/middleman (for multi-hop wireguard-connections)

- Think about the network setup, 2 networks are needed with non overlapping address space
  - For this example following setup will be used:
    - Network Client (end-user) <-> Middleman (router), run by MIDDLEMAN:51820
      - 172.16.0.0/12
      - Middleman-IP on this interface is 172.16.0.1/12
      - Client-IP on this interface is 172.16.0.2/12
    - Network Middleman (router) <-> Endpoint, run by ENDPOINT:51820
      - 10.0.0.0/8
      - Middleman-IP on this Interface is 10.0.0.5
      - Endpoint-IP on this Interface is 10.0.0.1
- configure the wireguard interface for the next hop
  - Set allowed_ips in the configuration to the internal network of the next hop wireguard-network
    - example: 10.0.0.0/8
  - Activate the interface
    - If you forgot to change allowed_ips to the next-hop internal network, your server is down now
- set additional variables:
  - wireguard_server__route: true
  - wireguard_server__route_interface_ipv4: 10.0.0.5
  - wireguard_server__route_interface_ipv6: ipv6 address in network of next hop (if ipv6 is used)
- deploy role
- setup configuration for the client on the middleman
