# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp

@dx = [1, 1, 1, 0, 0, -1, -1, -1]
@dy = [1, 0, -1, 1, -1, 1, 0, -1]

def dfs(h, w)
  @fields[h][w] = 0
  8.times do |i|
    nh = h + @dy[i]
    nw = w + @dx[i]

    next if nh.negative? || nw.negative? || nh >= @h || nw >= @w
    next if @fields[nh][nw].zero?

    dfs(nh, nw)
  end
end

counters = []
while (@w, @h = gets.chomp.split.map(&:to_i)) != [0, 0]
  @fields = Array.new(@h) { Array.new(@w) }
  @h.times do |i|
    @fields[i] = gets.chomp.split.map(&:to_i)
  end

  count = 0
  @h.times do |hi|
    @w.times do |wi|
      next if @fields[hi][wi].zero?
      dfs(hi, wi)
      count += 1
    end
  end
  counters << count
end

puts counters.join("\n")
