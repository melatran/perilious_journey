require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test
  def setup
    @subject = Node.new('Burke')
  end

  def test_new_returns_a_node
    assert_instance_of Node, @subject
  end

  def test_surname_returns_name
    assert_equal 'Burke', @subject.surname
  end

  def test_next_node_returns_nil
    assert_nil @subject.next_node
  end

  def test_tail_returns_true_if_next_node_nil
    assert_equal true, @subject.tail?
  end

  def test_next_node_can_change_node_state
    data = 'Judy'
    @subject.next_node = data
    result = @subject.next_node

    assert_equal data, result
  end
end
