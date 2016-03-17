
def my_min_1(array)
  array.each do |el|
    return el if array.all? { |new_el| el <= new_el }
  end
end

def my_min_2(array)
  lowest = array.first
  array.drop(1).each do |el|
    lowest = el if el < lowest
  end
  lowest
end
