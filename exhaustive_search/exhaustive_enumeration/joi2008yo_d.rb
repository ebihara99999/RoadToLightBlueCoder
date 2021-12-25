# frozen_string_literal: true
# ref: https://atcoder.jp/contests/joi2008yo/tasks/joi2008yo_d

m = gets.chomp.to_i
stars_looking_for = []
m.times do
  stars_looking_for << gets.chomp.split(' ').map(&:to_i)
end

n = gets.chomp.to_i

stars_pic = []

n.times do
  stars_pic << gets.chomp.split(' ').map(&:to_i)
end

ans_dx = 0
ans_dy = 0
stars_pic.each do |stp|
  not_exist = false
  dx = stp[0] - stars_looking_for[0][0]
  dy = stp[1] - stars_looking_for[0][1]

  stars_looking_for.each_with_index do |stl, i|
    next if i.zero?

    moved = [stl[0] + dx, stl[1] + dy]
    not_exist = stars_pic.include?(moved)

    break unless not_exist
  end
  next unless not_exist

  ans_dx = dx
  ans_dy = dy
  break
end

puts "#{ans_dx} #{ans_dy}"
