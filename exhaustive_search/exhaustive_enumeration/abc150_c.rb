# ref: https://atcoder.jp/contests/abc150/tasks/abc150_c

n = gets.chomp.to_i
p_arr = gets.chomp.split.map(&:to_i)
q_arr = gets.chomp.split.map(&:to_i)

all = (1..n).to_a.permutation(n)

p_index = all.find_index(p_arr)
q_index = all.find_index(q_arr)

p (p_index - q_index).abs
