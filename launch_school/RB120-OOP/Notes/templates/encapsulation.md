Encapsulation refers to the practice of hiding certain pieces of functionality from rest of the codebase.

Ruby implements encapsulation by using objects. Broadly speaking, classes encapsulate behaviors and objects encapsulate state.

Method access control is also one of the ways of implementing encapsulation at the class level.

Let us suppose a Computer is a player in some strategic board game. When we are writing a program for the game, we can simply create a Computer object and let it handle all the tasks that the Computer ought to do. Here is an outline for how the Computer might make a choice:

```ruby
class Computer
  def initialize
    @name = options.sample
  end

  def options
    ["Hal", "Alpha", "Deep Blue",  "Aster"]
  end

  def chooses(board)
    strategic_choice(board)
  end

  private

  def strategic_choice(board)
    if win_possible?(board)
      winning_move(board)
    elsif loss_possible?(board)
      prevent_loss(board)
    elsif high_priority_move_available?(board)
      choose_high_priority_move(board)
    else
      choose_randomly(board)
    end
  end

  def win_possible?(board)
  end

  def winning_move(board)
  end

  def loss_possible?(board)
  end

  def prevent_loss(board)
  end

  def high_priority_move_available?(board)
  end

  def choose_high_priority_move(board)
  end

  def chooses_randomly(board)
  end
end

class Board
end

board = Board.new
computer = Computer.new
computer.chooses(board)
```

In this code, all the details about how a computer finds a move is hidden from the rest of the code base. We can simply invoke the method `chooses` on the `computer` object and pass in the `board`. The method invocation returns the move to be made and it suffices for the rest of the program to work. Rest of the code base does not need access to other details about the computer. All the implementation details are hidden from the public interface. This practice of hiding unnecessary details is called encapsulation.

