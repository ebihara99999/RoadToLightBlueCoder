# frozen_string_literal: true
# Ref: https://onlinejudge.u-aizu.ac.jp/problems/ITP1_7_B

n, x = gets.split(' ')
results = []

(1..n - 2).each do |j|
  (2..n - 1).each do |k|
    next unless j < k

    (3..n).each do |l|
      next unless k < l

      results << "#{j}#{k}#{l}"
    end
  end
end

p results.select { |r| r.chars.map(&:to_i).sum == x }.count
