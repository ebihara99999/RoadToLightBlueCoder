# frozen_string_literal: true

height, width, n = gets.chomp.split.map(&:to_i)

dx = [0, 0, 1, -1]
dy = [1, -1, 0, 0]
hp = 1
distance = 0
graph = Array.new(height) { Array.new(width, '') }

sx = -1
sy = -1
height.times do |i|
  graph[i] = gets.chomp.split('')
  x = graph[i].find_index('S')
  unless x.nil?
    sy = i
    sx = x
  end
end

queue = []

dist = Array.new(height) { Array.new(width, -1) }
dist[sy][sx] = 0

queue << [sx, sy]
is_break = false
counter = 1

until queue.empty?
  x, y = queue.shift

  4.times do |i|
    ny = y + dy[i]
    nx = x + dx[i]

    next if nx >= width || ny >= height || nx.negative? || ny.negative?
    next if dist[ny][nx] != -1
    next if graph[ny][nx] == 'X'

    dist[ny][nx] = dist[y][x] + 1
    queue << [nx, ny]

    next unless graph[ny][nx].to_i == counter

    if counter == n
      is_break = true
      distance += dist[ny][nx]
    else
      counter += 1
      hp += 1
      distance += dist[ny][nx]
      dist = Array.new(height) { Array.new(width, -1) }
      dist[ny][nx] = 0
      queue = [[nx, ny]]
    end
    break
  end
  break if is_break
end

p distance
