# ref: https://atcoder.jp/contests/pakencamp-2019-day3/tasks/pakencamp_2019_day3_c

n, m = gets.chomp.split.map(&:to_i)

scores = Array.new(n) { Array.new(m) }

n.times do |i|
  scores[i] = gets.chomp.split.map(&:to_i)
end

highest_score = 0
(1..m).to_a.permutation(2).each do |a, b|
  tmp_score = 0
  n.times do |i|
    scores[i][a - 1] > scores[i][b - 1] ? tmp_score += scores[i][a - 1] : tmp_score += scores[i][b - 1]
  end
  highest_score = tmp_score if tmp_score > highest_score
end

p highest_score
