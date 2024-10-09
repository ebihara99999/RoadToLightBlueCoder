# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja#

n = gets.chomp.to_i

graph = []
n.times do |i|
  graph[i] = gets.chomp.split.map { |v| v.to_i - 1 }
  graph[i].shift
  graph[i].shift
end

seen = Array.new(n, false)

@first_orders = []
@last_orders = []
@timestamp = 0

def dfs(graph, v, seen)
  seen[v] = true
  @first_orders[v] = @timestamp += 1
  graph[v].each do |nv|
    next if seen[nv]
    dfs(graph, nv, seen)
  end

  @last_orders[v] = @timestamp += 1
end

while seen.include?(false)
  start = seen.index(false)
  dfs(graph, start, seen)
end

puts n.times.map { |i| "#{i + 1} #{@first_orders[i]} #{@last_orders[i]}" }.join("\n")
