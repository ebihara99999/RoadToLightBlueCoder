# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_C&lang=ja

n, w = gets.chomp.split.map(&:to_i)

values = Array.new(n, 0)
weights = Array.new(n, 0)

n.times do |i|
  values[i], weights[i] = gets.chomp.split.map(&:to_i)
end

dp = Array.new(w + 1, 0)

(0..w).each do |w|
  n.times do |i|
    dp[w] = if weights[i] <= w
              [dp[w], dp[w - weights[i]] + values[i]].max
            else
              dp[w]
            end
  end
end

puts dp[w]
