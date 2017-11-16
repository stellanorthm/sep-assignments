require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
    elsif @tail
      @tail.next = node
    end
    @tail = node
    @tail.next = nil
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    @tail = @tail.prev
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    puts node.data
    node = node.next
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
    @head.prev = nil
  end
end
