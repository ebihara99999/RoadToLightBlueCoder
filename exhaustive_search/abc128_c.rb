# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc128/tasks/abc128_c

n, m = gets.chomp.split(' ').map(&:to_i)

bulbs = []
m.times do
  bulbs << gets.chomp.split(' ').map(&:to_i)
end

plist = gets.chomp.split(' ').map(&:to_i)

combi_cnt = 0
[1, 0].repeated_permutation(n) do |bits|
  lit_cnt = 0
  bulbs.each_with_index do |bulb, i|
    on_cnt = 0
    bulb[0].times do |b|
      on_cnt += bits[bulb[b + 1] - 1]
    end
    lit_cnt += 1 if on_cnt % 2 == plist[i]
  end
  combi_cnt += 1 if lit_cnt == m
end

puts combi_cnt
