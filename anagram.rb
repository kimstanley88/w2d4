def first_anagram?(string1, string2)
  permutations = string1.split("").permutation.to_a
  permutations.map! { |perm| perm.join("") }
  permutations.include?(string2)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(string1, string2)
  string2_array = string2.split("")

  string1.each_char do |character|
    i = string2_array.index(character)
    return false if i.nil?
    string2_array[i] = nil
  end

  string2_array.compact!
  string2_array.empty?
end

def third_anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram?(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string1.each_char { |el| hash1[el] += 1 }
  string2.each_char { |el| hash2[el] += 1 }

  hash2 == hash1
end



p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
