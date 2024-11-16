_, k = gets.chomp.split.map(&:to_i)
s = gets.chomp

zeros = s.split('1').filter_map { |c| c unless c.empty? }
ones = s.split('0').filter_map { |c| c unless c.empty? }

ones[k - 2] = ones[k - 1].concat(ones[k - 2])
ones[k - 1] = ''

start = s[0]

if ones.length < zeros.length
  loop do
    ones.push('')
    break if ones.length == zeros.length
  end
elsif ones.length > zeros.length
  loop do
    zeros.push('')
    break if ones.length == zeros.length
  end
end

answer = if start == '0'
           [zeros, ones].transpose.join
         else
           [ones, zeros].transpose.join
         end

puts answer
