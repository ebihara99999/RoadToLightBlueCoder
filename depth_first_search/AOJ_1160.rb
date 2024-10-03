# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp

@dx = [1, 1, 1, 0, 0, -1, -1, -1]
@dy = [1, 0, -1, 1, -1, 1, 0, -1]

def dfs(h, w)
  @fields[h][w] = 0
  8.times do |i|
    nh = h + @dx[i]
    nw = w + @dy[i]

    next if nh.negative? || nh >= @h || nw.negative? || nw >= @w
    next if @fields[nh][nw].zero?

    dfs(nh, nw)
  end
end

counts = []

while (@w, @h = gets.chomp.split.map(&:to_i)) != [0, 0]
  @fields = Array.new(@h) { Array.new(@w) }
  @h.times do |i|
    @fields[i] = gets.chomp.split.map(&:to_i)
  end

  count = 0

  @h.times do |i|
    @w.times do |j|
      next if @fields[i][j].zero?

      dfs(i, j)
      count += 1
    end
  end
  counts << count
end

puts counts.join("\n")
