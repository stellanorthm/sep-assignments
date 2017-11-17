class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    it = @items[index(key, @size)]
    if it == nil
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif it.key != key
      while @items[index(key, @size)].key != key && @items[index(key, @size)].key != nil
        resize
        @new_index = index(key, @size)
        if @items[new_index] == nil
          break
        end
      end
    elsif it.key == key && it.value != value
      resize
      it.value = value
    end
  end


  def [](key)
    i = index(key, size())
    return it.value if it
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @size = @items.length
  end

end
