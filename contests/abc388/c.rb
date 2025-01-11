n = gets.chomp.to_i
ar = gets.chomp.split.map(&:to_i)

answer = 0

(n - 1).times do
  a = ar.shift
  # 0 個の場合の脱出ルート
  break if a * 2 > ar.last

  index = ar.bsearch_index { |b| a * 2 <= b }
  next if index.nil?

  answer += ar.length - index
end

puts answer
