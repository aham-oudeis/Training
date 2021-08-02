class StackEmptyError < StandardError; end

class Minilang
  attr_reader :command, :register

  def initialize(command)
    @command = command.split
    @register = 0
    @stack = []
  end

  def eval
    @command.each do |imperative|
      if imperative.match?(/\d/)
        store(imperative.to_i)
      else
        begin
          send(imperative.downcase.to_sym)
        rescue NoMethodError => e
          puts "Invalid token: #{e.name.upcase}"
          return
        rescue StackEmptyError => e
          puts e.message
          return
        end
      end
    end
  end

  def store(num)
    @register = num
  end

  def print
    puts register
  end

  def push
    @stack << register
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register = @stack.pop * register
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    raise StackEmptyError.new("Stack Empty") if @stack.empty?
    @register = @stack.pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
10
5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)