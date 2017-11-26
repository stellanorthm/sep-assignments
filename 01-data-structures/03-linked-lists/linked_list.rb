require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    return unless node
    @head = node if @head.nil?
    @tail.next = node if @tail
    @tail = node
    @tail.next = nil
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @tail.nil?
      return nil
    elsif @head.next.nil?
      @tail = nil
    else
      curr = @head
      until curr.next == @tail
        curr = curr.next
      end
      curr.next = nil
      @tail = curr
    end
  end

  # This method prints out a representation of the list.
  def print
    node = @head
    while node != @tail
      break if node.nil?
      puts node.data
      node = node.next
    end
    puts @tail.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      curr = @head
      until curr.next == node
        curr = curr.next
      end
      curr.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head.nil? && self.tail.nil? ? (@head = node && @tail = node) : @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @tail == @head ? @head = nil : @head = @head.next
  end

end
