require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @size)
    hashed_item = @items[i]
    if hashed_item == nil
      @items[i] = Node.new(key, value)
    elsif hashed_item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        index2 = index(key, @size)
        break if @items[index2] == nil
      end
      self[key] = value
    elsif hashed_item.key == key && hashed_item.value != value
      if next_open_index(indy) == -1
        resize
        index2 = index(key, @size)
        @items[index2].value = value
      else
        index3 = next_open_index(index(key, @size))
        @items[index3] = value
      end
    end
  end

  def [](key)
    i = @items[index(key, @size)]
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (index...@size).each do |item|
      return item if @hash[item] == nil
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    return @size = hash.length
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
