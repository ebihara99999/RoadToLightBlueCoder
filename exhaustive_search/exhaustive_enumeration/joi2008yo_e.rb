# frozen_string_literal: true

# https://atcoder.jp/contests/joi2008yo/tasks/joi2008yo_e

r, c = gets.split(' ').map(&:to_i)

crackers = Array.new(r) { Array.new(c) }

r.times do |i|
  crackers[i] = gets.split(' ').map(&:to_i)
end

sheets = []

[1, 0].repeated_permutation(r) do |bits|
  tmp_crackers = Marshal.load(Marshal.dump(crackers))
  # choose which rows to reverse
  bits.each_with_index do |bit, i|
    next if bit.zero?

    tmp_crackers[i].each_with_index do |cracker, ii|
      tmp_crackers[i][ii] = if cracker == 1
                              0
                            else
                              1
                            end
    end
  end

  tmp_sheets = []
  # which colomns to reverse
  # and calculate the total
  tmp_crackers.transpose.each_with_index do |col, _iii|
    tmp_count = 0
    tmp_count = col.select(&:zero?).size

    tmp_arr = []
    col.each_with_index do |co, _j|
      tmp_arr << if co == 1
                   0
                 else
                   1
                 end
    end

    tmp_sheets << [tmp_arr.select(&:zero?).size, tmp_count].max
  end
  sheets << tmp_sheets.sum
end
p sheets.max
