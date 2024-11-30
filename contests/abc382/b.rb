_, D = gets.chomp.split.map(&:to_i)
S = gets.chomp.split('')

answer = []
count = 0
S.reverse_each do |s|
  if s == '.'
    answer << s
  else
    if count < D
      count += 1
      answer << '.'
    else
      answer << s
    end
  end
end

puts answer.reverse.join('')
