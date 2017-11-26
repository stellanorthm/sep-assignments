require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i = index(key, @size)
    hashed_i = @items[i]
    if hashed_i.nil?
      @items[i] = Node.new(key, value)
    elsif hashed_i.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        index_2 = index(key, @size)
        break if @items[index_2] == nil
      end
      self[key] = value
    elsif hashed_i.key == key && hashed_i.value != value
      if next_open_index(i) == -1
        resize
        index_2 = index(key, @size)
        @items[index_2].value = value
      else
        new_index = next_open_index(index(key, @size))
        @items[new_index] = value
      end
    end
  end

  def [](key)
    i = @items[index(key, @size)]
    i.nil? ? nil : i.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    initial_index = index
    while index <= (@size -1)
      if @items[index] == nil
        return index
      elsif @items[index] != nil && index == (initial_index - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@size -1)
        index = 0
      else
        index += 1
      end
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @size
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
end
