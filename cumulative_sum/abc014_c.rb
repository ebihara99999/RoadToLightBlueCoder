# ref: https://atcoder.jp/contests/abc014/tasks/abc014_3

n = gets.chomp.to_i
pattern = 1_000_001
colors = Array.new(pattern, 0)

n.times do
  a, b = gets.chomp.split.map(&:to_i)
  colors[a] += 1
  colors[b + 1] -= 1 unless colors[b + 1].nil?
end

answers = []
pattern.times do |i|
  if i.zero?
    answers[i] = colors[i]
    next
  end

  answers[i] = answers[i - 1] + colors[i]
end
p answers.max
