_ = gets.chomp.to_i
s = gets.chomp.chars
t = gets.chomp.chars

count = 0
if s.count > t.count
  t.each_with_index do |c, i|
    next if c == s[i]
    next if c == s[i + 1]

    count += 1
  end

  if count.zero?
    puts 'Yes'
  else
    puts 'No'
  end
elsif s.count < t.count
  s.each_with_index do |c, i|
    next if c == t[i]
    next if c == t[i + 1]

    count += 1
  end
  if count.zero?
    puts 'Yes'
  else
    puts 'No'
  end
else
  s.each_with_index do |c, i|
    next if c == t[i]

    count += 1
  end
  if count < 2
    puts 'Yes'
  else
    puts 'No'
  end
end
