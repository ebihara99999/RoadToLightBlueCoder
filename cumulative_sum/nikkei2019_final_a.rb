# ref: https://atcoder.jp/contests/nikkei2019-final/tasks/nikkei2019_final_a
# 16:02 17:29 with rest...

n = gets.chomp.to_i
sums = [0]
alist = gets.chomp.split.map(&:to_i)

alist.each_with_index do |a, i|
  sums[i + 1] = sums[i] + a
end

(1..n).each do |k|
  i = 0
  max = 0
  while i + k <= n
    max = sums[i + k] - sums[i] > max ? sums[i + k] - sums[i] : max
    i += 1
  end
  p max
end
