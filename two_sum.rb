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

  array.each_with_index do |num, i|
    complement = target - num
    found_index = binary_search(sorted_array, complement)

    if !found_index.nil?
      if num != complement
        return true
      else
        sorted_array.delete_at(found_index)
        found_index = binary_search(sorted_array, complement)
        return true if !found_index.nil?
      end
    end
  end

  false
end

def pair_sum?(array, target)
  num_hash = Hash.new(0)


  array.each { |num| num_hash[num] += 1 }

  array.each do |num|
    complement = target - num
    if num == complement
      return true if num_hash[num] > 1
    else
      return true if num_hash[num] > 0 && num_hash[complement] > 0
    end
  end
  false
end

arr = [0, 1, 5, 7]
arr2 = [0, 2, 3]
 # p okay_two_sum?(arr, 6) # => should be true
 # p okay_two_sum?(arr, 10) # => should be false
 # p okay_two_sum?(arr2, 4)

 p pair_sum?(arr, 6) # => should be true
 p pair_sum?(arr, 10) # => should be false
 p pair_sum?(arr2, 4)
