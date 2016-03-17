require 'byebug'

def first_anagram?(first_word, target_word)

  all_anagrams = first_word.chars.permutation.to_a.map(&:join)
  all_anagrams.include?(target_word)

end

def second_anagram?(first, target)
  first_copy = first.dup.chars
  target_copy = target.dup.chars

  first.each_char.with_index do |letter1, i|
    target.each_char.with_index do |letter2, j|
      if letter1 == letter2
        first_copy[i] = nil
        target_copy[j] = nil
      end
    end
  end
  first_copy.all? { |c| c.nil? } && target_copy.all? { |c| c.nil? }
end

def third_anagram?(first, target)
  first.chars.sort == target.chars.sort
end

def fourth_anagram?(first, target)
  first_hash = Hash.new { |hash, key| hash[key] = 0 }
  target_hash = Hash.new { |hash, key| hash[key] = 0 }

  first.each_char do |letter|
    first_hash[letter] += 1
  end

  target.each_char do |letter|
    target_hash[letter] += 1
  end

  first_hash == target_hash
end


p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
