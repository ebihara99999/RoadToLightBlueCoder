# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_B&lang=ja

n, w = gets.chomp.split.map(&:to_i)
weights = Array.new(n)
values = Array.new(n)

n.times do |i|
  values[i], weights[i] = gets.chomp.split.map(&:to_i)
end

# This satisfies the initial condition.
dp = Array.new(n + 1) { Array.new(w + 1, 0) }

n.times do |i|
  (0..w).each do |j|
    dp[i + 1][j] = if j >= weights[i]
                     [(dp[i][j - weights[i]] + values[i]), dp[i][j]].max
                   else
                     dp[i][j]
                   end
  end
end

puts dp[n][w]
