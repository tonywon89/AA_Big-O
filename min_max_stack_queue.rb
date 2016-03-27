require_relative 'stack_queue'

class MinMaxStackQueue < StackQueue

  def max
    @head.max > @tail.max ? @head.max : @tail.max
  end

  def min
    @head.min < @tail.min ? @head.min : @tail.min
  end

end

queue = MinMaxStackQueue.new
queue.enqueue(1)
queue.enqueue(7)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(3)
queue.enqueue(5)
p queue.max
p queue.min
queue.dequeue
p queue.max
p queue.min
queue.dequeue
p queue.max
p queue.min
