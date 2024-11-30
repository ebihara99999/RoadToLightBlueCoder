N, D = gets.chomp.split.map(&:to_i)
dots = gets.chomp.split('').select { |s| s == '.' }.compact

puts D + dots.length
