# frozen_string_literal: true

$count = 0

first_orders = []
last_orders = []

def dfs(graph, id, visited, first_orders, last_orders)
  first_orders[id] = $count = $count += 1
  visited[id] = true
  graph[id].each do |next_id|
    next if visited[next_id]

    dfs(graph, next_id, visited, first_orders, last_orders)
  end
  last_orders[id] = $count = $count += 1
end

n = gets.chomp.to_i

graph = Array.new(n) { [] }

n.times do
  val, _, *adj = gets.chomp.split.map(&:to_i)
  adj.each do |a|
    graph[val - 1] << a - 1
  end
end

visited = Array.new(n, false)

dfs(graph, 0, visited, first_orders, last_orders)

n.times do |i|
  puts "#{i + 1} #{first_orders[i]} #{last_orders[i]}"
end
