# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja#

$counter = 0
first_orders = []
last_orders = []

def dfs(graph, v, visited, first_orders, last_orders)
  first_orders[v] = $counter　= $counter + 1
  visited[v] = true

  graph[v].each do |adj|
    next if visited[adj]
    dfs(graph, adj, visited, first_orders, last_orders)
  end

  last_orders[v] = $counter = $counter + 1
end

n = gets.chomp.to_i
graph = Array.new(n) { []}
visited = Array.new(n, false)

n.times do |i|
  _, _, *adj = gets.chomp.split.map(&:to_i)
  adj.each do |a|
    graph[i] << a - 1
  end
end

while visited(&:!) do
  v = visited.find_index(false)
  dfs(graph, v, visited, first_orders, last_orders)
end

n.times do |i|
  puts "#{i + 1} #{first_orders[i]} #{last_orders[i]}"
end
