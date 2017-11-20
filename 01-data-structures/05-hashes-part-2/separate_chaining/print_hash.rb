class PrintHash

  def loadFactor
    @size = @size + 0.0
    @factor = @entries / @size
    return @factor
  end

  def print_hash(hash)
    (0...@size).each do |item|
      if @hash[item] != nil
        puts "Index is #{item}"
        @hash[item].print
      end
    end
    puts "Load Factor is #{loadFactor}"
  end

end
