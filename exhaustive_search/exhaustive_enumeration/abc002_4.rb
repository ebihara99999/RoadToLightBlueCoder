# frozen_string_literal: true

# ref: https://atcoder.jp/contests/abc002/tasks/abc002_4
# 40hun
n, m = gets.chomp.split(' ').map(&:to_i)

# link = {}

# acquaintances.map { |ac| [ac].to_h }.each do |ac|
#   if link.keys.include?(:"#{ac.keys.first}")
#     link[:"#{ac.keys.first}"] << ac.values.first
#   else
#     link[:"#{ac.keys.first}"] = [ac.values.first]
#   end
# end

acquaintances = Array.new(n) { Array.new(n) { 0 } }

m.times do
  x, y = gets.chomp.split(' ').map(&:to_i)
  acquaintances[x - 1][y - 1] = 1
  acquaintances[y - 1][x - 1] = 1
end

mem = 0

[1, 0].repeated_permutation(n) do |bits|
  people = (1..n).map.select { |i| bits[i - 1] == 1 }

  flag = true
  people.each do |i|
    people.each do |j|
      next if i == j
      flag = acquaintances[people[i - 1] - 1][people[j - 1] - 1].zero?
    end
  end
  mem = people.size if flag && people.size > mem
end

puts mem
