class MyStack
  def initialize
    @store = []

  end

  def push(val)
    meta = {val: val}
    if empty?
      meta[:min] = val
      meta[:max] = val
    else
      top = self.peek
      meta[:max] =  top[:max] > val ? top[:max] : val
      meta[:min] =  top[:min] < val ? top[:min] : val
    end
    @store << meta
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def max
    self.peek[:max] if self.size > 0
  end

  def min
    self.peek[:min] if self.size > 0
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

stack = MyStack.new

stack.push(5)
stack.push(4)
stack.push(2)
stack.push(3)
stack.push(1)
p stack.max
p stack.min
stack.pop
p stack.max
p stack.min
