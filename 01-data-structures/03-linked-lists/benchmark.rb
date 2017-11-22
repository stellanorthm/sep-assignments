require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = []
new_list = LinkedList.new

p "Array Created"
puts Benchmark.measure {
  array = []
  (0...10000).each do |x|
    array[x] = Node.new(x)
  end
}

p "Node of 10,000"
puts Benchmark.measure {
  (0...10000).each do |x|
    new_list.add_to_tail(Node.new(x))
  end
}

p "Array access 500th index"
puts Benchmark.measure {
  array[4999]
}

p "Access 500th Node"
puts Benchmark.measure {
  node = new_list.head
  (1..4999).each do |x|
    node = node.next
  end
}

p "Array delete 500th index"
puts Benchmark.measure {
  array.delete_at(4999)
}

p "Delete 500th Node"
puts Benchmark.measure {
  node = new_list.head
  (1..4999).each do |x|
    node = node.next
  end
  new_list.delete(node)
}
