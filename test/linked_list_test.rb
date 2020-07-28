require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list.rb'

class LinkedListTest < Minitest::Test
  def setup
    @subject = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @subject
  end

  def test_head_returns_nil_when_first_initialized
    assert_nil @subject.head
  end

  def test_append_adds_new_node_to_end_of_list
    result = @subject.append('West')

    assert_instance_of Node, result
    assert_equal 'West', result.surname
    assert_equal result, @subject.head
  end

  def test_it_can_return_a_zero_for_empty_list
    assert_equal 0, @subject.count
  end

  def test_can_return_count_for_list
    @subject.append("West")
    assert_equal 1, @subject.count
  end

  def test_string_returns_phrase
    @subject.append("West")
    assert_equal "The West family", @subject.to_string
  end

  def test_append_multiple_nodes
    @subject.append("Rhodes")
    @subject.append("Hardy")

    result = @subject.head.next_node.surname
    assert_equal 'Hardy', result
  end

  def test_last_node_returns_tail
    @subject.append("Rhodes")

    result = @subject.last_node(@subject.head)
    assert_instance_of Node, result
    assert_equal "Rhodes", result.surname
  end

  def test_to_string_works_with_three_nodes
    @subject.append('Rhodes')
    @subject.append('Hardy')
    @subject.append('Smith')
    expected = 'The Rhodes family, followed by the Hardy family, followed by the Smith family'

    result = @subject.to_string

    assert_equal expected, result
  end
end
