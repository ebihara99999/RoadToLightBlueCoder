# frozen_string_literal: true

_ = gets.chomp.to_i
a_parts = gets.split.map(&:to_i).sort.reverse
b_parts = gets.split.map(&:to_i)
c_parts = gets.split.map(&:to_i).sort

cnt = 0
b_parts.each do |bp|
  boundary = a_parts.bsearch_index { |ap| ap < bp }
  next if boundary.nil?

  a_cnt = a_parts.size - boundary

  boundary = c_parts.bsearch_index { |cp| bp < cp }
  next if boundary.nil?

  c_cnt = c_parts.size - boundary

  cnt += a_cnt * c_cnt
end

p cnt
