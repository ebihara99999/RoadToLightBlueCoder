# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_A&lang=ja

n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)
_ = gets.chomp
m = gets.chomp.split.map(&:to_i)

results = []
sums = []

(1<<n).times do |i|
  sum = 0

  n.times do |bit|
    sum += a[bit] if i & (1 << bit) != 0
  end
  sums.push(sum)
end

m.each do |mi|
  results.push(sums.include?(mi) ? 'yes' : 'no')
end

puts results
