# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_B&lang=ja

@n, @w = gets.chomp.split.map(&:to_i)
weights = Array.new(@n, 0)
values = Array.new(@n, 0)

@n.times do |i|
  values[i], weights[i] = gets.chomp.split.map(&:to_i)
end

dp = Array.new(@n + 1) { Array.new(@w + 1, 0) }
# (0..@n).each { |i| dp[i][0] = 0 }

@n.times do |i|
  (@w + 1).times do |w|
    dp[i + 1][w] = if w >= weights[i]
                     [dp[i][w], dp[i][w - weights[i]] + values[i]].max
                   else
                     dp[i][w]
                   end
  end
end

p dp[@n][@w]
