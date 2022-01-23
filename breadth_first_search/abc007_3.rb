# frozen_string_literal: true

#22:05 43

r, c = gets.chomp.split.map(&:to_i)
sy, sx = gets.chomp.split.map(&:to_i)
gy, gx = gets.chomp.split.map(&:to_i)

sy -= 1
sx -= 1
gy -= 1
gx -= 1

graph = Array.new(r) { Array.new(c) }

r.times do |i|
  graph[i] = gets.chomp.split('')
end

dx = [0, 0, 1, -1]
dy = [1, -1, 0, 0]

queue = []

queue << [sx, sy]
dist = Array.new(r) { Array.new(c, -1) }

dist[sy][sx] = 0

while !queue.empty?
  x, y = queue.shift
  binding.irb if x.nil? || y.nil?

  4.times do |i|
    nx = x + dx[i]
    ny = y + dy[i]

    next if graph[ny][nx] == '#'
    next if dist[ny][nx] != -1

    dist[ny][nx] = dist[y][x] + 1
    break if dist[gy][gx] != -1

    queue << [nx, ny]
  end
end

p dist[gy][gx]
