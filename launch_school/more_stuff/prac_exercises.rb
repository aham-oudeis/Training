# a program that checks if the sequence of characters 'lab' exists in the following string

a_list = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

pattern = /lab/

a_proc = proc {|item| p item if pattern.match(item)}

a_list.each(&a_proc) 

# it should print "Hello from inside the execute method!"
# if we add block.call

def execute(&block)
  begin
    block.call
  rescue
    "Oops! Something went wrong!"
  end
end

execute {puts "Hello from the execute method!"}