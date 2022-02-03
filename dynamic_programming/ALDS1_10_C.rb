# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_C&lang=ja

n = gets.chomp.to_i
ans = Array.new(n, 0)
n.times do |k|
  str1 = gets.chomp.chars
  str2 = gets.chomp.chars

  dp = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  str1.each_with_index do |s1, i|
    str2.each_with_index do |s2, j|
      dp[i + 1][j + 1] = if s1 == s2
                           dp[i][j] + 1
                         else
                           [dp[i + 1][j], dp[i][j + 1]].max
                         end
    end
  end
  ans[k] = dp[str1.length][str2.length]
end

puts ans
