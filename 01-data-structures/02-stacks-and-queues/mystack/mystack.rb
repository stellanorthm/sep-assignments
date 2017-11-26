class MyStack
  attr_accessor :top

  def initialize
    
    @stack = Array.new
    @top = nil
  end

  def push(item)
    @stack.unshift(item)
    @top = @stack[0]
  end

  def pop
    @top = @stack[1]
    @stack.shift
  end

  def empty?
    @stack.length == 0
  end
end
