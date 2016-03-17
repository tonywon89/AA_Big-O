def bad_two_sum?(array, target)
  array.each_with_index do |num1, i|
    array.drop(i + 1).each do |num2|
      return true if num1 + num2 == target
    end
  end
  false
end

def binary_search(array, target) #return index of target, nil if not in array
  middle_index = array.length / 2
  middle_value = array[middle_index]

  return middle_index if target == middle_value
  return nil if middle_value.nil?

  left = array[0...middle_index]
  right = array[middle_index + 1..-1]

  if target < middle_value
    binary_search(left, target)
  else
    found_index = binary_search(right, target)
    !found_index.nil? ? middle_index + found_index + 1 : nil
  end
end

def okay_two_sum?(array, target)
  sorted_array = array.sort #n log n

  sum_combos = []

  ((target/2)+1).times do |i| #n
    sum_combos << [i, target-i]
  end

  sum_combos.each do |num1, num2| #n
    found_index1 = binary_search(sorted_array, num1)
    next if found_index1.nil?

    sorted_array.delete_at(found_index1)

    found_index2 = binary_search(sorted_array, num2)

    return true if found_index1 && found_index2
  end
  false
end

def pair_sum?(array, target)
  num_hash = Hash.new(0)
  sum_combos = []

  ((target/2)+1).times do |i| #n
    sum_combos << [i, target-i]
  end

  array.each { |num| num_hash[num] += 1 }

  sum_combos.each do |num1, num2|
    if num1 == num2
      return true if num_hash[num1] > 1
    else
      return true if num_hash[num1] > 0 && num_hash[num2] > 0
    end
  end
  false
end

arr = [0, 1, 5, 7]
 p pair_sum?(arr, 6) # => should be true
 p pair_sum?(arr, 10) # => should be false
