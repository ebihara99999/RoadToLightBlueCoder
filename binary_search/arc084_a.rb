# frozen_string_literal: true

_ = gets.chomp.to_i
a_parts = gets.split.map(&:to_i).sort
b_parts = gets.split.map(&:to_i).sort
c_parts = gets.split.map(&:to_i).sort

combi = []
a_parts.each do |ap|
  boundary = b_parts.bsearch { |bp| ap < bp }
  next if boundary.nil?

  b_parts.find_index(boundary).upto(b_parts.size - 1) { |i| combi << b_parts[i] }
end

cnt = 0

combi.sort.each do |bp|
  boundary = c_parts.bsearch { |cp| bp < cp }
  next if boundary.nil?

  cnt += (c_parts.size - c_parts.find_index(boundary))
end

p cnt
