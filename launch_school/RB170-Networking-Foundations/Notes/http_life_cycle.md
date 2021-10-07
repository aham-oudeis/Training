[HTTP Request and Response](http_request_n_response.md) || [HTTP Headers](http_headers.md) || [Status Code](status_code.md) || [HTTP Security Risks](http_security_risks.md)

# How Accessing a Webpage works

1. When you enter a URL like http://www.google.com into your web browser's address bar, the browser starts the process for sending a HTTP GET request to the IP address that corresponds to the domain name `google.com`.
2. If either your browser cache or computer's cache already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
3. The browser creates an HTTP request, which is packaged up and sent to your device's network interface.
   * The HTTP request would consist of a request line (method name, path, protocol version), and a header with `Host` as key and the domain name as value. It may look something like this:

      `GET / HTTP/1.1` 

      `Host: www.google.com`
4. Your device establishes a TCP connection with the server identified by the IP address.
5. Once the TCP connection is established, the packaged-up HTTP is encapsulated into a TCP segment. 
6. The TCP segment gets further encapsulated into an IP packet. 
7. The IP packet is then encapsulated into an Ethernet frame.
8. This Ethernet frame goes through varous network bridging devices and finally reaches the server with the matching IP address.
9. Once the server device receives the frame, the PDUs are appropriately de-encapsulated at different layers and the HTTP request is sent to the server application.
10. Finally, the server processes the request and sends a response over the Internet back to your network interface which hands it to your browser.
      * The HTTP response sent by the server has a mandatory Status line containing the status code, optional header, and an optional body. A HTTP response status line might look like this:

      `HTTP/1.1 200 OK`
      * The response headers contain information that is helpful to the browser for rendering the page. For instance, `Content_Type: html/txt`
11. Finally, the browser displays the response in the form of a web page.
