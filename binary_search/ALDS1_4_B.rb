# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_4_B&lang=ja#

# 差集合じゃだめかな

_ = gets.chomp.to_i
sl = gets.chomp.split.map(&:to_i)
_ = gets.chomp.to_i
tl = gets.chomp.split.map(&:to_i)
cnt = 0



tl.each do |t|
  left = 0
  right = sl.size - 1

  while left <= right do
    idx = left + (right - left) / 2

    if sl[idx] > t
      right = idx - 1
    elsif sl[idx] < t
      left = idx + 1
    else
      cnt += 1
      break
    end
  end
end

puts cnt
