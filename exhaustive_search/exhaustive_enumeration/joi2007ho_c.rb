# frozen_string_literal: true
# ref: https://atcoder.jp/contests/joi2007ho/tasks/joi2007ho_c 
# and https://www.ioi-jp.org/joi/2006/2007-ho-prob_and_sol/index.html
# 1.30 ~ 2.10
# 2.21 sqrtがintを返すという使用ではまった
n = gets.to_i

puts 0 if n < 4 && return

coordinates = []
n.times { coordinates << gets.split(' ').map(&:to_i) }

comb = coordinates.combination(2).to_a

lengths = []

comb.each do |com|
  x1 = com[0][0]
  x2 = com[1][0]
  y1 = com[0][1]
  y2 = com[1][1]
  lengths << (x1 - x2)**2 + (y1 - y2)**2
end
side = lengths.group_by(&:itself).select { |_, v| v.count >= 4 }.max&.first

if side.nil?
  puts 0
else
  puts side
end
