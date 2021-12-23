# frozen_string_literal: true
# ref: https://atcoder.jp/contests/s8pc-6/tasks/s8pc_6_b

# 入り口出口は誰かの買うもののマスに設置するのが最適となる

n = gets.chomp.to_i

buy_list = []
n.times { buy_list << gets.split(' ').map(&:to_i) }

ans_time_list = []
s_list = buy_list.map(&:first)
e_list = buy_list.map { |l| l[1] }
s_e_list = s_list.map { |s| e_list.map { |e| [s, e] } }

s_e_list.flatten(1).each do |s_e|
  st, en = s_e
  tmp_time_l = []
  buy_list.each do |items|
    a, b = items
    time = (st - a).abs + (b - a) + (en - b).abs # in every case the route is s - a - b - e.
    tmp_time_l << time
  end
  ans_time_list << tmp_time_l.sum
end

puts ans_time_list
