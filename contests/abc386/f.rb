k = gets.chomp.to_i
s = gets.chomp.chars
t = gets.chomp.chars

if s.count < t.count
  diff = t - s
else
  diff = s - t
end
binding.irb
if diff.size <= k
  puts 'Yes'
else
  puts 'No'
end
