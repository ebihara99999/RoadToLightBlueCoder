# https://atcoder.jp/contests/abc007/tasks/abc007_3
# 1825
# 1902

dx = [1, 0, -1, 0]
dy = [0, 1, 0, -1]

r, c = gets.chomp.split.map(&:to_i)
sy, sx = gets.chomp.split.map { |i| i.to_i - 1 }
gy, gx = gets.chomp.split.map { |i| i.to_i - 1 }

fields = Array.new(r) { Array.new(c) }
r.times do |i|
  fields[i] = gets.chomp.split('')
end

dist = Array.new(r) { Array.new(c, -1) }
queue = Array.new

dist[sy][sx] = 0
queue.push([sy, sx])

while !queue.empty?
  vy, vx = queue.shift

  4.times do |i|
    ny = vy + dy[i]
    nx = vx + dx[i]
    next if ny.negative? || nx.negative? || ny >= r || nx >= c
    next if dist[ny][nx] != -1
    next if fields[ny][nx] == '#'
    break if dist[gy][gx] != -1

    dist[ny][nx] = dist[vy][vx] + 1
    queue.push [ny, nx]
  end
end

p dist[gy][gx]
