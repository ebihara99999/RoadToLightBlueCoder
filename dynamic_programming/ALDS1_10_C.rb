# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_C&lang=ja

n = gets.chomp.to_i
ans = Array.new(n, 0)
n.times do |k|
  str1 = gets.chomp
  str2 = gets.chomp

  dp = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  (1..str1.length).each do |i|
    (1..str2.length).each do |j|
      dp[i][j] = if str1[i - 1] == str2[j - 1]
                   dp[i - 1][j - 1] + 1
                 else
                   [dp[i][j - 1], dp[i - 1][j]].max
                 end
    end
  end
  ans[k] = dp[str1.length][str2.length]
end

puts ans
