def first_anagram?(first_word, target_word)

  all_anagrams = first_word.chars.permutation.to_a.map(&:join)
  all_anagrams.include?(target_word)

end

p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives") 
