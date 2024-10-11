# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=DPL_1_B&lang=ja

@n, @w = gets.chomp.split.map(&:to_i)

values = []
weights = []

@n.times do
  v, w = gets.chomp.split.map(&:to_i)
  values << v
  weights << w
end

dp = Array.new(@n + 1) { Array.new(@w + 1, 0) }
@max = 0
@n.times do |i|
  (@w + 1).times do |w|
    if weights[i] <= w
      dp[i + 1][w] = [dp[i][w], (dp[i][w - weights[i]] + values[i])].max
      @max = [@max, dp[i + 1][w]].max
    else
      dp[i + 1][w] = dp[i][w]
    end
  end
end

puts @max
