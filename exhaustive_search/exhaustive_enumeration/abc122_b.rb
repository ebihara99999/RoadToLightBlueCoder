# ref: https://atcoder.jp/contests/abc122/tasks/abc122_b

s = gets.chomp

acgt = %w[A C G T]
ans = 0
tmp = ''
s.each_char.with_index do |char, i|
  if acgt.include?(char)
    tmp << char
    ans = tmp.size if tmp.size > ans
  else
    tmp = ''
  end
end

p ans
