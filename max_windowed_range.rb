def windowed_max_range(array, window_size)

  new_array = array
  max_range = 0
  while new_array.length >= window_size
    window = new_array.take(window_size)
    range = window.max - window.min
    max_range = range if max_range < range
    new_array = new_array.drop(1)
  end
  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
p windowed_max_range([1, 0, 2, 5, 4, 8], 3)
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)
