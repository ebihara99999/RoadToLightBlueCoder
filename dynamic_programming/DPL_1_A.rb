# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_A&lang=ja

n, m = gets.chomp.split.map(&:to_i)
c = gets.chomp.split.map(&:to_i)

dp = Array.new(n + 1, 100_000)
dp[0] = 0

(n + 1).times do |i|
  m.times do |j|
    dp[i + c[j]] = [dp[i + c[j]], dp[i] + 1].min if c[j] + i <= n
  end
end

p dp[n]
