S = gets.chomp.chars

zeros = []

count = 0

S.each do |s|
  if s == '0'
    zeros << s
  else
    count += 1
  end
end

puts(count + zeros.size / 2 + zeros.size % 2)
