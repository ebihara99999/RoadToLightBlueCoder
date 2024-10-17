# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_C&lang=ja

n = gets.chomp.to_i
n.times do
  s = gets.chomp
  t = gets.chomp

  dp = Array.new(s.size + 1) { Array.new(t.size + 1, 0) }

  s.size.times do |i|
    t.size.times do |j|
      if s[i] == t[j]
        dp[i + 1][j + 1] = [dp[i][j] + 1, dp[i + 1][j + 1]].max
      else
        dp[i + 1][j + 1] = [dp[i + 1][j + 1], dp[i + 1][j]].max
        dp[i + 1][j + 1] = [dp[i + 1][j + 1], dp[i][j + 1]].max
      end
    end
  end

  puts dp[s.size][t.size]
end
