
The Internet
  * Have a broad understanding of what the internet is and how it works
    - how the insfrastructure is designed and what protocols are involved in each step (to facilitate the commun.);
    - there are two main models for this process of communication over the internet
    - network of networks: switches (for local networks) and routers (to join those LANs) as intermediaries bridging devices to route the data journey
    - what makes this journey possible is the usage of protocols
    - web vs internet idea: only if asked! talk about http stuff

  * Understand the characteristics of the physical network, such as latency and bandwidth
    - latency is measure of delay (time that data takes to travel from A to B)
    - bandwidth is measure of capacity (amount of data that can be transmitted at a given unit of time)

  * Have a basic understanding of how lower level protocols operate
    - Anything below app layer are lower layers
    - TCP/UDP(multiplexing/demultipl of packages), IP(address to/from), Ethernet(node to node via MAC add; does MAC address refers to LAN level devices communication only?) are lower level protocols

  * Know what an IP address is and what a port number is
    - IP address is the address of a device, defined by the IP protocol, ordered in a hierarchical way such that it can be identified based on its position in the network.
    - Port number is an integeer to refer to a specific process or application on a device. 0-65535; 0-1023 (well-known); 1024-49151(registered); 49152-65535(dynamic)

  * Have an understanding of how DNS works
    - DNS is distributed system of data bases
    - It stands for Domain Name System
    - It translates domain  names into ip addresses

  * Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model
    - http structures the communication between the two parts present in an end-to-end communication
    - these two parts are defined in a client-server model, where the client request certain data and the server responds with the requested data
    -

TCP & UDP

  * Have a clear understanding of the TCP and UDP protocols, their similarities and differences
    - are protocols present in the transport layer
    - perform multiplexing and segmentation
    - TCP connection-oriented
      - reliable and secure
      - slow
      - three-way handshake
    - UDP connectionless
      - unreliable and unsecure
      - fast
  * Have a broad understanding of the three-way handshake and its purpose
    - Establishes connection with the application (prior to the send of any data)
    - SYN, SYN ACK, ACK
    - Specific to TCP protocol

  * Have a broad understanding of flow control and congestion avoidance
    - flow control is about controlling how much data you send to the server (the information needed for this is provided by the server in terms of the window header)
    - congestion control is about how much data you send on to the link (the informatiion needed for this is inferred from lost packets)

URLs

  * Be able to identify the components of a URL, including query strings
    1. Scheme
    2. Host
    3. Port
    3. Path
    4. Query String with parameters

    https://www.launchschool.com:80/courses?name=Networking%20Foundations

    * Scheme: Component of a URL that specifies how the application communicates with the server(mandatory)
    * Host: The device/server that the application is communicating with (mandatory)
    * Port: The identifier for the specific application in the server (optional)
    * Path: The location inside of the server (optional)
    * Query String: Extra information we pass to locate the specific item (optional)

  * Be able to construct a valid URL

  * Have an understanding of what URL encoding is and when it might be used
    * Characters not present in the 128-character ASCII-character set
    * Unsafe characters
    * Reserved characters

HTTP and the Request/Response Cycle
  * HTTP: Protocol that enables communication between client-application and server-application.HTTP is a protocol that standardizes the way resources on the web are transferred between applications. Request Response Cycle

  * Be able to explain what HTTP requests and responses are, and identify the components of each
    * Request
        * Method
        * Path
        * Version
        * Host
        - we need an empty line here to determine the end of basci components and start an optional body
    * Response
      * Status line (Number, Message)
      * Header (optional): the most relevant one would be 'location' (URL used when redirection needed, status code 302)
      * Body: content of the page being requested (html,css,js,pictures)

  * Be able to describe the HTTP request/response cycle
    - communication that happens between a client and a server using the http protocol
    - client would usually be a web browser, server would be the computer where the resource is stored
    - client enter an URL in the browser bar (or click on a link) and the browser creates and send a request that is sent over the network via a number of steps and protocols, and the server would respond with the requested resource in the form of a number of files, that the browser interpret and display.
    - mention here the components of both, the request and the response

  * Be able to explain what status codes are, and provide examples of different status code types
  * 200-299: 200 (Ok) --> all good
  * 300-399: 302 (Resource page relocated --> redirection
  * 400-499: 404 (Request page cannot be found) --> client error in request
  * 500-   : 500 (Server Error) --> server error or bug

  * Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
    - State relates to the idea of persistance of information throughout different cycles
    - since http servers do not retain state/information from previous cycle, they are said to bee stateless
    - but browsers can manage to maintain a resemblance of certain state through some techniques, such as sessions (through cookies) and AJAX (Asynchronous Javascript and XML)

  * Explain the difference between GET and POST, and know when to choose each

Security
  * Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
    * Cross-Site Scripting (By allowing users to imput html or javascript code without input sanitization)
    * Session Hijacking (Implementing sessions)
  * Be aware of the different services that TLS can provide, and have a broad understanding of each of those services
    * Encryption
    * Authentication via Certification
    * Integrity via hashing algorithm

Transport layer: the http request gets encapsulated as the data payload and the source and destination port numbers are added as a header, so this encapsulation of data is ready to be sent through the network, but first we need to connect with destination. If TCP protocol is used at this phase, a controlled and reliable port to port connection is established thanks to the three-way handshake. Alternatively we can use UDP protocol, which is less reliable but faster. Once the connection is established, data gets divided into segments (if TCP is the used protocol) or a datagrams (if UDP is the used protocol) and are sent using through the  channel.

The process by which distinct signals are sent through a single channel is called multiplexing (sending multiple signals over one connection).
