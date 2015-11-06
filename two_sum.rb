def bad_two_sum?(arr, target_sum)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end
# O(N^2)

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  n = 0
  sorted.each do |el|
    new_target = target_sum - el
    new_array = arr - [el]
    n = binary_search?(new_array, new_target)
    return n if n
  end
  n
end



arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 12) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def binary_search?(arr, target)

  return false if arr.length < 1

  half = arr.length/2
  lower = arr[0...half]
  upper = arr[(half + 1)..-1]

  case target <=> arr[half]
  when -1
    binary_search?(lower, target)
  when 0
    return true
  when 1
    binary_search?(upper, target)
  end
end
# p okay_two_sum?(arr, 12) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

#
# def awesome_two_sum?(arr, target)
#   hash = Hash.new
#   arr.each do |el|
#     hash[el] = arr - [el]
#   end
#
#   hash.each_key do |k|
#     return true if hash[k].include?(target - k.to_i)
#   end
#   false
# end

def awesome_two_sum?(arr, target)
  hash = Hash.new(false)
  arr.each do |el|
   complement = target - el
   if hash[complement] == true
     return true
   else
     hash[el] = true
   end
 end
 false
end


arr = [1,3,6,10,30]
p awesome_two_sum?(arr, 100) # => should be true
p awesome_two_sum?(arr, 31) # => should be false
