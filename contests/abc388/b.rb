N, D = gets.chomp.split.map(&:to_i)

tl = []
N.times { tl << gets.chomp.split.map(&:to_i) }

D.times do |i|
  max = 0
  tl.each do |a|
    t, l = a
    max = if max < t * (l + i + 1)
            t * (l + i + 1)
          else
            max
          end
  end
  puts max
end
