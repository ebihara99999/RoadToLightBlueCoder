# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp

@dx = [1, 1, 1, 0, 0, -1, -1, -1]
@dy = [-1, 0, 1, -1, 1, -1, 0, 1]

def dfs(h, w)
  @fields[h][w] = 0
  8.times do |i|
    hh = h + @dy[i]
    ww = w + @dx[i]

    next if hh.negative? || ww.negative? || hh > @h - 1 || ww > @w - 1

    next if @fields[hh][ww].zero?

    dfs(hh, ww)
  end
end

counts = []
while (@w, @h = gets.chomp.split.map(&:to_i)) != [0, 0]
  @fields = Array.new(@h) { Array.new(@w) { 0 } }
  @h.times do |i|
    @fields[i] = gets.chomp.split.map(&:to_i)
  end
  islands = 0
  @h.times do |y|
    @w.times do |x|
      next if @fields[y][x].zero?

      dfs(y, x)
      islands += 1
    end
  end
  counts << islands
end

counts.each { |c| p c }
