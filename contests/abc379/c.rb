n, m = gets.chomp.split.map(&:to_i)
X = gets.chomp.split.map { |x| x.to_i - 1 }
A = gets.chomp.split.map(&:to_i)

if A.sum < n
  puts -1
  exit
end

squares = Array.new(n, 0)
X.each_with_index do |x, i|
  squares[x] = A[i]
end

indexes_more_than_two = squares.each_index.select { |i| squares[i] > 1 }
total = 0

indexes_more_than_two.each do |i|
  indexes_zero = squares.each_index.select { |i| squares[i].zero? }
  indexes_zero.each do |j|
    next if i > j

    total += j - i
    squares[i] -= 1
    squares[j] += 1
    break if squares[i] == 1
  end
end

squares.find { |s| s != 1 } ? puts(-1) : puts(total)
