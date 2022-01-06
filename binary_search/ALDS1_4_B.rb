# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_4_B&lang=ja#

n = gets.chomp.to_i
slist = gets.split.map(&:to_i)
q = gets.chomp.to_i
tlist = gets.split.map(&:to_i)

# Need to consider condition to break
cnt = 0
tlist.each do |t|
  last = slist.size
  start = 0
  loop do
    idx = ((last - start) / 2).round

    if slist[idx] > t
      start = idx
    elsif slist[idx] == t
      cnt += 1
      break
    else
      last = idx
    end
  end
end
