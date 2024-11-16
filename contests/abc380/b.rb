S = gets.chomp.split('|')
S.shift
answer = []
S.each do |s|
  answer << s.length
end

puts answer.join(' ')
