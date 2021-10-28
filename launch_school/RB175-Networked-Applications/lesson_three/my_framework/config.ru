# config.ru

require_relative "app"

run App.new

# what line 5 does is abstracts away all the details about creating
# a socket, opening a TCP connection, parsing the http request,
# execute the `call` method in the `App` class, catch the return value,
# parse the return value and then send back a http response to the client.
# For this process to work efficiently, the `App` class has to be
# defined in a particular way. It must have an instance method `call`
# that accepts the `env` argument. This `env` argument is something
# Rack prepares. This is a huge bag of parsed http request structured as
# a key-value pair. The `call` method has to be designed in such a way
# that it operates on the `env` object and returns a value. 
# Since the proc object have a built-in `call` method, we can
# use a proc object to store all the application logic. 
# Or, we can construct our our own class and define a `call` method.