require "socket"

server = TCPServer.new("localhost", 30015)


def roll_dice(num, face)
	list = Array.new(num.to_i).map { |_| rand(face.to_i) + 1 }
	list.join(", ")
end

def parse_reqest(str)
	met, path_uri, protocol = (str).split(" ")
	path, query_str = path_uri.split("?")
	params  = (query_str || "").split("&").map { |str| str.split("=")}.to_h

	[met, path, params, protocol]
end

loop do
	client = server.accept

	request_line = client.gets
	puts request_line

	next unless request_line
	
	method, path, params, protocol = parse_reqest(request_line)
	number = params["number"].to_i

	client.puts "HTTP/1.1 200 OK"
	client.puts "Content-Type: text/html"
	client.puts
	client.puts "<!DOCTYPE html><html>"
	client.puts "<body>"
	client.puts "<h1>Counter</h1>"
	client.puts "<p>The current number is #{number}.</p>"
	client.puts "<a href='/?number=#{number - 1}'>Add One</a>"
	client.puts "<a href='/?number=#{number + 1}'>Substract One</a>"
	client.puts "</body>"
	client.puts "</html>"
	client.close
end