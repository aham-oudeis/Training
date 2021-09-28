# HTTP

## Key Terms

__HTTP__

HTTP, or Hypertext Transfer Protocol, is a system of rules, a protocol, that serve as a link between applications and the transfer of hypertext documents. Stated differently, it's an agreement, or message format, of how machines communicate with each other. HTTP follows a simple model where a client makes a request to a server and waits for a response. Hence, it's referred to as a request response protocol.

__DNS__

Domain Name System or DNS is a distributed database which translates domain names like www.google.com to an IP address, so that the IP address can then be used to make a request to the server. DNS databases are stored on computers called DNS servers.

__How Accessing a Webpage works__

1. Enter a URL like http://www.google.com into your web browser's address bar.
2. The browser creates an HTTP request, which is packaged up and sent to your device's network interface.
3. If your device already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
4. The packaged-up HTTP request then goes over the Internet where it is directed to the server with the matching IP address.
5. The remote server accepts the request and sends a response over the Internet back to your network interface which hands it to your browser.
6. Finally, the browser displays the response in the form of a web page.

__Status Code__

The `status code` is a three-digit number that the server sends back after receiving a request signifying the status of the request. The `status text` displayed next to the `status code` provides the description of the code.

`200 OK`: The requested resource was handled successfully.

`302 Found`: The requested resource has moved temporarily. Usually results in a redirect.
  * When you try to access a page that requires you to login first, this is the status line we get that results in a redirect to the login page and then back the original requested page.

`404 Not Found`: The server returns this status code when the requested resource cannot be found.
  * When we specify a path or a file that the server cannot locate, we get this status code

`500 Internal Server Error`: This is a generic error status code and the core problem can range from misconfigured server setting to a misplaced comma in the application codee. This indicates a server-side problem.

__Statelessness__

HTTP protocol is stateless because the request-response pairs are independent of each other. That is, the server does not hang on to the information from previous request-response cycle.

__Stateful Applications__

1. Through the use of session identifier:
   * The server sends some form off a unique token to the client and whenever the client makes a request to the server, it aappends this token as a part of the request. This allows server to identify clients.
   * This sort of faux statefulness has several consequences. First, every request must be inspected to see if it contains a session identifier. Second, if this request does, in fact, contain a session id, the server must check to ensure that this session id is still valid. The server needs to maintain some rules with regards to how to handle session expiration and also decide how to store its session data. Third, the server needs to retrieve the session data based on the session id. And finally, the server needs to recreate the application state (e.g., the HTML for a web request) from the session data and send it back to the client as the response.
   * A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. They contain the session information.

2. Through the use of AJAX

__Security Threats__

1. Session Hijacking (perhaps through packet sniffing)
   Solutions
   * Resetting sessions
   * Expiration of sessions
   * Using HTTPs
2. Cross-Site Scripting (XSS)
   * This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.
  Solutions
  * Input sanitization. Use markdown
  * Escape all user data when displaying it.
