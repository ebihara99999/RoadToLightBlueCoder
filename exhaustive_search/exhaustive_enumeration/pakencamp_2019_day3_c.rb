# frozen_string_literal: true
# ref: https://atcoder.jp/contests/pakencamp-2019-day3/tasks/pakencamp_2019_day3_c

# 4曲ある場合、1曲目と2曲目、2曲目と3曲目、3と4、1と4、1と3という組み合わせをまず作る
# 1, 2 / 1, 3 / 1, 4 / 2, 3 / 2, 4 / 3, 4
# 各メンバーの得点を出す
# それぞれの組み合わせで高いものを出す

n, m = gets.split(' ').map(&:to_i)

array = []
(1..m - 1).each do |left|
  (2..m).each do |right|
    next if left >= right

    array << [left, right]
  end
end

high_scores = Array.new(n) { Array.new() }

n.times do |student_num|
  scores = gets.split(' ').map(&:to_i)
  array.each do |song|
    score = (scores[song[0] - 1] > scores[song[1] - 1]) ? scores[song[0] - 1] : scores[song[1] - 1]
    high_scores[student_num - 1] << score
  end
end

puts high_scores.transpose.collect(&:sum).max
