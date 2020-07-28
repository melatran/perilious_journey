require './lib/node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(surname)
    node = Node.new(surname)
    if empty?
      self.head = node
    else
      last_node(head).next_node = node
    end
  end

  def empty?
    head.nil?
  end

  def count
    if @head.nil?
      0
    else
      1
    end
  end

  def to_string
    return " " if empty?
    return sentence if @head.tail?
    string_node(head.next_node, sentence)
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def concat(sentence, node)
    "#{sentence}, followed by the #{node.surname} family"
  end

  def string_node(node, sentence)
    return concat(sentence, node) if node.tail?
    string_node(node.next_node, concat(sentence, node))
  end

  def sentence
    "The #{@head.surname} family"
  end
end
