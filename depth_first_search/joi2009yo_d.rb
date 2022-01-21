# frozen_string_literal: true

# ref: https://atcoder.jp/contests/joi2009yo/tasks/joi2009yo_d

@dx = [0, 0, 1, -1]
@dy = [1, -1, 0, 0]
@ans = 0

def dfs(xx, yy, count, visited)
  count += 1
  @ans = count if @ans < count

  visited[yy][xx] = true

  4.times do |i|
    nxx = xx + @dx[i]
    nyy = yy + @dy[i]

    next if nxx.negative? || nyy.negative? || nxx > @x - 1 || nyy > @y - 1
    next if @fields[nyy][nxx].zero?
    next if visited[nyy][nxx]

    dfs(nxx, nyy, count, visited)
  end
end

@x = gets.chomp.to_i
@y = gets.chomp.to_i

@fields = Array.new(@y) { Array.new(@x, 0) }

@y.times do |i|
  @fields[i] = gets.chomp.split.map(&:to_i)
end

@x.times do |xx|
  @y.times do |yy|
    visited = Array.new(@y) { Array.new(@x, false) }
    dfs(xx, yy, 0, visited)
  end
end

puts @ans
