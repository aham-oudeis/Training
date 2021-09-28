# Internet

## Key Terms

__Network__
* When at least two or more devices are connected in such a way that they can exchange data, it forms a network

__LAN__
* A network of computers connected locally via cables to network bridging device, such as a switch or a hub
* A LAN connected wirelessly is WLAN
* The scope of communication is limited to the devices connected to the switch

__Internet__
* Internet is a vast network of networks connected sustained by a wide array of components, such as routers, switches, cables, radiowaves, etc.
* A router is a device that routes network traffic to other networks.

__Network Infrastructure__
* Network Infrastructure is simply the physical devices and mediums that undergrid the internet

__Protocol__
* A set of rules governing the exchange of data so as to enable various facets of systematic communication.
* A protocol might deal with the structure of the messages or the order of the messages or the delivery of the messages.

Two reasons for the wide variety of protocols:
1. Different protocols evolve to address different aspects of the communication. E.g. TCP and IP address different aspects.
2. Different protocols evolve to address the same aspect of the communication but in different ways. E.g. TCP and UDP address the same aspect but in different ways.

__Layers__
* While the communication over internet is composed of a large number of protocols addressing different aspects of communication, it is helpful to divide the aspects of communication in terms of layers. This is a layered approach to understanding communication over the internet.

* There are two well known models to dividing up the layers: OSI model and Internet Protocol Suite TCP/IP model.
* The difference in the model is rooted in how the models carve up the communication layer. While OSI carves up the layers in terms of specific function that each layer provides, Internet Protocol Suite carves up the layers in termsof the scope of communication.

__Encapsulation__
* Encapsulation in the context of networking refers to the process of packaging the data from the layer above with protocol-specific metadata of the current layer. This package is reffered as a PDU.

__Protocol Data Units__
* Protocol Data units are bundles composed of a protocol-specific header (and sometimes a trailer/footer) and the data payload from the layer above.

__Latency__
* Latency is a measure of time it takes for data to get from one point in the network to another point.
* It is a measure of delay between sending and receiving data.
* It includes propagation delay, transmission delay, processing delays, and queuing delay.

1. Round Trip Latency: Latency involved in sending data added to the latency involved in receiving acknowledgement.
2. Last Mile Latency: Latency concentrated near the edge of the network; this is generally the delay involved in getting data from your local ISP to the LAN.

__Bandwidth__
* Bandwidth is the amount of data that can be transmitted in a given unit of time (usually per second).

__Internet Protocol__
* The dominant protocol (for the Internet layer)  that is responsible for the communication between hosts in different networks.

__IP Address__

__Packet__
* Protocol data unit for the Network/Internet layer

__Ethernet__
* Protocol governing the Link layer/ Data link layer (Layer 2 of OSI model)

__Frame__
* Protocol data unit of the Link layer and the lowest layer where encapsulation happens.

__MAC Address__
MAC Addresses is a permanent address assigned to the Network Interface Card (NIC) of every device connected to a networrk. It is formatted as a sequence of six two-digit hexadecimal numbers, e.g. 00:40:96:9d:68:0a, with different ranges of addresses being assigned to different network hardware manufacturers.


