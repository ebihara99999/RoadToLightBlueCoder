# frozen_string_literal: true

# ref: https://atcoder.jp/contests/abc088/tasks/abc088_d

dx = [0, 0, 1, -1]
dy = [1, -1, 0, 0]

gy, gx = gets.chomp.split.map(&:to_i)

graph = Array.new(gy) { Array.new(gx, '') }
black_count = 0
gy.times do |i|
  graph[i] = gets.chomp.split('')
  black_count += graph[i].select { |g| g == '#' }.count
end

queue = [[0, 0]]
dist = Array.new(gy) { Array.new(gx, -1) }
dist[0][0] = 0

prev_x = Array.new(gy) { Array.new(gx, -1) }
prev_y = Array.new(gy) { Array.new(gx, -1) }

is_goal = false
until queue.empty?
  x, y = queue.shift
  4.times do |i|
    nx = x + dx[i]
    ny = y + dy[i]

    next if nx >= gx || ny >= gy || nx.negative? || ny.negative?
    next if dist[ny][nx] != -1
    next if graph[ny][nx] == '#'

    dist[ny][nx] = dist[y][x] + 1
    prev_x[ny][nx] = x
    prev_y[ny][nx] = y

    if [nx, ny] == [gx, gy]
      is_goal = true
      break
    end

    queue << [nx, ny]
  end
  break if is_goal
end

if dist[gy - 1][gx - 1] == -1
  puts(-1)
  return
end

routes = [[gx - 1, gy - 1]]
dist[gy - 1][gx - 1].times do |i|
  routes << [prev_x[routes[i][1]][routes[i][0]], prev_y[routes[i][1]][routes[i][0]]]
end

puts(gy * gx - routes.size - black_count)
