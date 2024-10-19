# frozen_string_literal: true
n, c = gets.chomp.split.map(&:to_i)
t = gets.chomp.split.map(&:to_i)

get_time = t.shift
count = 1

(n - 1).times do
  time = t.shift
  if time - get_time >= c
    count += 1
    get_time = time
  end
end

p count
