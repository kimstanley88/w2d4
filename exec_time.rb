def my_min1(list)
  list.each do |el1|
    return el1 if list.all? { |el2| el1 <= el2 }
  end

end

def my_min2(list)
  min = list.first
  list.each do |el|
    if el < min
      min = el
    end
  end
  min
end

def lcs(list)
  all_sub_arrays = []

  (0...list.length).each do |i|
    (i...list.length).each do |j|
      all_sub_arrays << list[i..j]
    end
  end

  max = 0
  all_sub_arrays.each do |array|
    if max < array.inject(:+)
      max = array.inject(:+)
    end
  end

  max


end

def lcs2(list)
  current_max = 0
  overall_max = list.first
  list.each do |num|
    current_max = 0 if current_max < 0
    current_max += num

    overall_max = current_max if current_max > overall_max
  end

  overall_max
end




list = []
p lcs2(list) # => 8

#p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])
