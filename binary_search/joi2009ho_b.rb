# frozen_string_literal: true
# ref: https://atcoder.jp/contests/joi2009ho/tasks/joi2009ho_b
d = gets.to_i
n = gets.to_i
m = gets.to_i
shops = [0]
(n - 1).times do
  shops << gets.to_i
end
shops.sort!
dests = []

m.times do
  dests << gets.to_i
end

distances = []

dests.each do |dest|
  last = shops.size - 1
  start = 0

  loop do
    idx = (start + (last - start) / 2).round
    if shops[idx] < dest
      if start == shops.size - 1
        distances << [d - dest, dest - shops.last].min
        break
      elsif start >= last
        distances << [shops[idx + 1] - dest, dest - shops[idx]].min
        break
      end
      start = idx + 1
    elsif shops[idx] == dest
      break
    else
      if last.zero?
        distances << [dest, shops[1] - dest].min
        break
      elsif start >= last
        distances << [shops[idx] - dest, dest - shops[idx - 1]].min
        break
      end
      last = idx - 1
    end
  end
end

p distances.sum
