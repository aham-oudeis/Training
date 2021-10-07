[Internet Layer](internet.md) ||  [Ethernet](ethernet.md)  || [Transport Layer](transport_layer.md)

## Internet/Network layer

It provides communication between devices on different networks. It provides two main services:
1. Routing capability
2. Data encapsulation in the form of packets

## Routing capability
Since the IP addresses are hierarchical and logical, the process of locating a specific id address is more manageable. That means, using different parts of the IP address, routers can figure out which router to send the data. Sub-netting is the mechanism for dividng the IP address into heirarchical subnetworks.

In contrast, MAC addresses are flat and burned-in. While a device's MAC address is permanent, a device's IP address is relative to the network it is connected to. 

__Internet Protocol__
* The dominant protocol (for the Internet layer)  that is responsible for the communication between hosts in different networks.

__IP Address__
* Unique address of a device assigned according to the IP protocol.

## Data Encapsulation
The PDU from the Transport layer is further encapsulated into an internet packet, by adding, among other things, the source and destination IP address to the header.

__Packet__
* Protocol data unit for the Network/Internet layer

__IPV4 and IPV6__
While IPv4 is a 32-bit address that uses four octets in a dotted decimal system, IPv6 is a 128-bit address that uses eight colon separated hexadecimal numbers each 16 bit.

__Differences between IPv4 and IPv6__
copied from [here](https://www.guru99.com/difference-ipv4-vs-ipv6.html)

* Pv4 is 32-Bit IP address whereas IPv6 is a 128-Bit IP address.
* IPv4 is a numeric addressing method whereas IPv6 is an alphanumeric addressing method.
* IPv4 binary bits are separated by a dot(.) whereas IPv6 binary bits are separated by a colon(:).
* IPv4 offers 12 header fields whereas IPv6 offers 8 header fields.
* IPv4 supports broadcast whereas IPv6 doesn’t support broadcast.
* IPv4 has checksum fields while IPv6 doesn’t have checksum fields
* IPv4 uses ARP (Address Resolution Protocol) to map to MAC address whereas IPv6 uses NDP (Neighbour Discovery Protocol) to map to MAC address.