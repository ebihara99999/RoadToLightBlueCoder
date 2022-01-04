# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc145/tasks/abc145_c

n = gets.chomp.to_i
city = Array.new(n) { Array.new(2) }
n.times do |i|
  city[i][0], city[i][1] = gets.split.map(&:to_i)
end

distances = []
routes = (0..n - 1).to_a.permutation.to_a

routes.each do |route|
  tmp = []
  route.each_index do |i|
    next if i == n - 1

    tmp << Math.sqrt((city[route[i]][0] - city[route[i + 1]][0])**2 + (city[route[i]][1] - city[route[i + 1]][1])**2)
  end
  distances << tmp.sum
end

p distances.sum / routes.size
