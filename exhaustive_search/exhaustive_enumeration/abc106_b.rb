# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc106/tasks/abc106_b

n = gets.chomp.to_i
result = 0

(3..n).each do |num|
  next if num.even?

  divisors = [1, num]
  (3..num - 1).each do |divisor|
    divisors << divisor if (num % divisor).zero?
  end
  result += 1 if divisors.size == 8
end

puts result
