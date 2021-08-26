require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'to_do_list.rb'

class TodoListTest < MiniTest::Test
  attr_reader :todo1, :todo2, :todo3, :todos, :list

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, list.size)
  end

  def test_first
    assert_same(todo1, list.first)
  end

  def test_last
    assert_same(todo3, list.last)
  end

  def test_shift
    assert_same(todo1, list.shift) &&
    assert_equal(2, list.size)
  end

  def test_pop
    assert_same(todo3, list.pop) &&
    assert_equal(2, list.size)
  end

  def test_done?
    assert_equal(false, list.done?)
    list.first.done!
    assert_equal(false, list.done?)
    list.done!
    assert_equal(true, list.done?)
  end

  def test_add_for_error
    assert_raises(TypeError) { list.add("hello") }
  end

  def test_if_shovel_returns_collection
    todo_test = Todo.new("Sweep the room")
    assert_equal(list, list << todo_test)
    assert_raises(TypeError) { list << "hello" }
  end

  def test_if_shovel_appends_item
    todo_test = Todo.new("Sweep the room")
    list << todo_test
    assert_same(todo_test, list.last)
  end

  def test_item_at
    assert_same(todo1, list.item_at(0))
  end

  def test_mark_done_at
    list.mark_done_at(0)
    assert_equal(true, todo1.done?)
    assert_raises(IndexError) { list.mark_done_at(5) }
  end

  def test_mark_undone_at
    list.mark_done_at(0)
    assert_equal(true, todo1.done?)
    list.mark_undone_at(0)
    assert_equal(false, todo1.done?)
    assert_raises(IndexError) { list.mark_undone_at(5) }
  end

  def test_done_for_all_items
    list.done!
    todos.all? { |todo| assert_equal(true, todo.done?)}
  end

  def test_remove_at
    list.remove_at(0)
    refute_equal(todo1, list.first)
    assert_raises(IndexError) { list.remove_at(10)}
  end

  def test_find_by
    assert_equal(todo1, list.find_by("Buy milk"))
    assert_nil(list.find_by("Buy an aeroplane"))
  end

  def test_mark_done_by_str
    list.mark_done("Buy milk")
    assert_equal(true, todo1.done?)
  end

  def test_all_done
    assert_empty(list.all_done)
    todo1.done!
    assert_equal(todo1, list.all_done.first)
    assert_equal(todo1, list.all_done.last)
  end

  def test_all_undone
    assert_equal(3, list.all_not_done.size)
    list.done!
    assert_empty(list.all_not_done)
  end

  def test_mark_all_done
    list.mark_all_done
    assert_empty(list.all_not_done)
  end

  def test_mark_all_undone
    list.done!
    assert_empty(list.all_not_done)
    list.mark_all_undone
    assert_empty(list.all_done)
  end

  def test_empty
    refute_equal(true, list.empty?)
    assert_equal(true, TodoList.new("test").empty?)
  end

  def test_to_s_with_undone_items
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_one_done_items
    list.first.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_done_items
    list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each_for_iteration
    iterated_items = []
    list.each { |item| iterated_items << item }
    assert_equal(iterated_items, todos)
  end

  def test_each_for_return_value
    assert_equal(list, list.each { next })
  end

  def test_select_for_new_object
    refute_same(list, list.select { true })
  end
end
