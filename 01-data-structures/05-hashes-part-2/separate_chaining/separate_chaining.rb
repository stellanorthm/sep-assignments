require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @hash = Array.new(size)
    @entries = 0
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = Node.new(key, value)
    @items[i] != nil ? list = @items[i] : list = LinkedList.new
    list.add_to_tail(n)
    @items[i] = list
    @entries = @entries + 1
  end

  def [](key)
    l = @items.at(index(key, @items.size))
    if list.nil?
      current_item = list.head
      while current_item.nil?
        if current_item.key == key
          return current_item.value
        end
        current_item = current_item.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.split("").each do | i |
      next if i.ord == 0
      sum = sum + i.ord
    end
    return sum % size
  end

  # Calculate the current load factor
  def load_factor
    @size = size + 0.0
    int = @entries / @size
    return int
  end

  # Simple method to return the number of items in the hash
  def size
    return @hash.length
  end

  # Resize the hash
  def resize
    @size = @size * 2
    x_hash = Array.new(@size)
    @items.each do | i |
      if i != nil
        x_hash[index(i.key, @size)] = i
      end
    end
    @items = x_hash
  end

  def loadFactor
    @size = @size + 0.0
    @factor = @entries / @size
    return @factor
  end

  def print_hash
    (0...@size).each do |item|
      if @hash[item] != nil
        puts "Index is #{item}"
        @hash[item].print
      end
    end
    puts "Load Factor is #{loadFactor}"
  end


end
