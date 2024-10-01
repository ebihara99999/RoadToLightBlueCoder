# ref: https://atcoder.jp/contests/abc145/tasks/abc145_c

n = gets.chomp.to_i
factorial = (1..n).inject(:*)

coordinates = []

n.times do |i|
  coordinates << gets.chomp.split.map(&:to_i)
end

distances = []

(1..n).to_a.permutation(n).each do |cities|
  cities.each_cons(2) do |city1, city2|
    distances <<
      Math.sqrt((coordinates[city1 - 1][0] - coordinates[city2 - 1][0])**2 + (coordinates[city1 - 1][1] - coordinates[city2 - 1][1])**2)
  end
end

p distances.sum / factorial
