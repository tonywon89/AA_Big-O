require_relative 'min_max_stack_queue'

def windowed_max_range(array, window_size)

  new_array = array
  max_range = 0
  queue = MinMaxStackQueue.new
  index = 0

  window_size.times do |i|
    queue.enqueue(array[i])
    index += 1
  end

  range = queue.max - queue.min
  max_range = range if max_range < range

  until index > array.length


    queue.dequeue
    queue.enqueue(array[index])

    range = queue.max - queue.min
    max_range = range if max_range < range
    
    index += 1
  end





  window.each { |num| queue.enqueue }





  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
p windowed_max_range([1, 0, 2, 5, 4, 8], 3)
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)
