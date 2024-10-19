# frozen_string_literal: true
n, q = gets.chomp.split.map(&:to_i)

count = 0
hands = { R: 2, L: 1 }

q.times do
  h, g = gets.chomp.split
  g = g.to_i
  opposite = if h == 'R'
               'L'
             else
               'R'
             end

  before = hands[h.to_s.to_sym]

  tmp = if before < g
          (before.to_s.to_i..g).to_a
        else
          (g..before.to_s.to_i).to_a
        end

  count += if tmp.include? hands[opposite.to_s.to_sym]
             # 重なる場合
             n - (g - before).abs
           else
             # 最短で行ける場合
             (g - before).abs
           end
  hands[h.to_s.to_sym] = g
end

p count
