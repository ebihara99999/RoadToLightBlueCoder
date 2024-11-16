# これ ruby だと楽だよねという例になるかも

_, k = gets.chomp.split.map(&:to_i)
S = gets.chomp.split('X')

total = 0

S.each do |s|
  total += s.size / k
end

puts total
