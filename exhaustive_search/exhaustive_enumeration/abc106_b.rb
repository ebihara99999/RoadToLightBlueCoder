
n = gets.chomp.to_i

arr = (1..n).select { |i| i.odd? }

result = 0
(105..n).each do |x|
  count = 0
  arr.each do |y|
    count += 1 if (x % y).zero?
  end
  result += 1 if count == 8
end

p result
