_, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

K = 200_010

id = Array.new(K, -1)
r = K

A.each_with_index do |a, i|
  while r > a
    r -= 1
    id[r] = i + 1
  end
end

B.each do |b|
  puts id[b]
end
