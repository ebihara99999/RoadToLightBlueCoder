# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc150/tasks/abc150_c

n = gets.chomp.to_i

p = gets.split.map(&:to_i)
q = gets.split.map(&:to_i)

pi = nil
qi = nil

(1..n).to_a.permutation.to_a.each_with_index do |bits, i|
  pi = i if bits == p
  qi = i if bits == q
  break if !pi.nil? && !qi.nil?
end

p (pi - qi).abs
