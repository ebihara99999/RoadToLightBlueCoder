_, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

min = A.min
B.each do |b|
  if b < min
    puts -1
    next
  end
#
  ans = A.find_index { |a| a <= b }
  if ans.nil?
    puts -1
  else
    puts ans + 1
  end
end
