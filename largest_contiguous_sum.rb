require 'byebug'

def largest_contiguous_subsum_1(list)

  sub_lists = []
  list.each_with_index do |num1, i|
    my_sub = [num1]
    sub_lists << my_sub
    list.drop(i+1).each_with_index do |num2, j|
      my_sub += [num2]
      sub_lists << my_sub unless my_sub.length == 1
    end
  end
  max_sum = nil
  sub_lists.each do |sub_list|
    sum_of_sublist = sub_list.inject(0, :+)
    max_sum = sum_of_sublist if max_sum.nil? || sum_of_sublist > max_sum
  end
  max_sum
end

def largest_contiguous_subsum_2(list)
  max_sum = list.first
  current_sum = list.first

  list.drop(1).each do |num|
    new_sum = current_sum + num
    max_sum = new_sum if new_sum > max_sum

    current_sum += num

    if max_sum < num
      current_sum = num
      max_sum = num
    end

  enda
  max_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum_2(list) # => 8

list = [2,3, 36]
p largest_contiguous_subsum_2(list)
