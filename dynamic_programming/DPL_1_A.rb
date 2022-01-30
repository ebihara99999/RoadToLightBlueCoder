# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_A&lang=ja

n, m = gets.chomp.split.map(&:to_i)
coins = gets.chomp.split.map(&:to_i)
coins.unshift 0

dp = Array.new(m + 1) { Array.new(n + 1) }
(0..n).each { |jj| dp[0][jj] = n + 100 }
(0..m).each { |ii| dp[ii][0] = 0 }
(1..m).each do |i|
  (1..n).each do |j|
    dp[i][j] = if j < coins[i]
                 dp[i - 1][j]
               else
                 [dp[i - 1][j], 1 + dp[i][j - coins[i]]].min
               end
  end
end

puts dp.transpose[n].min
