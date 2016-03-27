require_relative 'my_stack'

class StackQueue
  def initialize
    @head = MyStack.new
    @tail = MyStack.new
  end

  def enqueue(val)
    @tail.push(val)
  end

  def dequeue
    if @head.empty?
      until @tail.empty?
        @head.push(@tail.pop)
      end
    else
      @head.pop
    end
  end

  def size
    @head.size + @tail.size
  end

  def empty?
    @head.empty?
  end

  def max
    !@head.empty? && @head.max < @tail.max ? @tail.max : @head.max
  end

  def min
    !@head.empty? && @head.min > @tail.min ? @tail.min : @head.min
  end
end

stack = StackQueue.new

stack.enqueue(1)
stack.enqueue(3)
stack.enqueue(2)
stack.enqueue(4)
stack.enqueue(5)
p stack.max
p stack.min
stack.dequeue
p stack.max
p stack.min
stack.deque
p stack.max
p stack.min
