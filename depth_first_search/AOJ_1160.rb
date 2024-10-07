# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp
# 12:34

@dw = [1, 1, 1, 0, 0, -1, -1, -1]
@dh = [1, 0, -1, 1, -1, 1, 0, -1]

@counts = []

def dfs(h, w)
  8.times do |i|
    nh = h + @dh[i]
    nw = w + @dw[i]

    next if nw.negative? || nh.negative? || nh >= @h || nw >= @w
    next if @field[nh][nw].zero?
    @field[nh][nw] = 0
    dfs(nh, nw)
  end
end

while (@w, @h = gets.chomp.split.map(&:to_i)) != [0, 0] do
  @count = 0

  @field = []
  @h.times do |i|
    @field[i] = gets.chomp.split.map(&:to_i)
  end

  @w.times do |wi|
    @h.times do |hi|
      next if @field[hi][wi].zero?
      dfs(hi, wi)
      @count += 1
    end
  end

  @counts << @count
end

puts @counts
