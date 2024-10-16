# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_C&lang=ja

n, @w = gets.chomp.split.map(&:to_i)
weights = Array.new(n)
values = Array.new(n)

n.times do |i|
  values[i], weights[i] = gets.chomp.split.map(&:to_i)
end

dp = Array.new(@w + 1, 0)

(@w + 1).times do |w|
  n.times do |i|
    dp[w] = [dp[w], dp[w - weights[i]] + values[i]].max if w >= weights[i]
  end
end

puts dp[@w]
