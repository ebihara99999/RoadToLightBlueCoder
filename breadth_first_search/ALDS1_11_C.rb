# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_C&lang=ja

n = gets.to_i

graph = Array.new(n) { [] }

n.times do |i|
  graph[i] = gets.chomp.split.map(&:to_i)
  graph[i].shift
  graph[i].shift
end

queue = []
dist = Array.new(n, -1)

dist[0] = 0
queue << 0

while !queue.empty?
  v = queue.shift
  graph[v].each do |nv|
    nv -= 1
    next if dist[nv] != -1

    dist[nv] = dist[v] + 1
    queue << nv
  end
end

dist.each_with_index do |d, i|
  puts "#{i + 1} #{d}"
end
