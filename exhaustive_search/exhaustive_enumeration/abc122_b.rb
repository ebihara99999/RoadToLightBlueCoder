# ref: https://atcoder.jp/contests/abc122/tasks/abc122_b

s = gets.chomp
result = ''
acgt_str = %w[A C G T]
length = 0

s.each_char do |char|
  if acgt_str.include? char
    result << char
  else
    length = result.length if length < result.length
    result = ''
  end
end

length = result.length if length < result.length
puts length
