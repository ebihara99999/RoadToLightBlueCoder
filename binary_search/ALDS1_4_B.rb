# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_4_B&lang=ja#

_ = gets.chomp.to_i
slist = gets.split.map(&:to_i)
_ = gets.chomp.to_i
tlist = gets.split.map(&:to_i)

cnt = 0

tlist.each do |t|
  last = slist.size - 1
  start = 0
  loop do
    idx = (start + (last - start) / 2).round
    if slist[idx] < t
      start = idx + 1
      break if start == slist.size - 1
    elsif slist[idx] == t
      cnt += 1
      break
    else
      last = idx - 1
      break if last.zero?
    end
  end
end

p cnt
