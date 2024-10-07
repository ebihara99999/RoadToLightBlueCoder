# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_B&lang=ja#
n = gets.to_i

graph = Array.new(n) { [] }

n.times do |i|
  graph[i] = gets.chomp.split.map { |x| x.to_i - 1 }
  graph[i].shift
  graph[i].shift
end

@first_orders = []
@last_orders = []
@order = 0
seen = Array.new(n, false)

def dfs(graph, v, seen)
  seen[v] = true
  @first_orders[v] = @order += 1

  graph[v].each do |nv|
    next if seen[nv]
    dfs(graph, nv, seen)
  end

  @last_orders[v] = @order += 1
end

while seen.include?(false)
  v = seen.index(false)
  dfs(graph, v, seen)
end

n.times do |i|
  puts "#{i + 1} #{@first_orders[i]} #{@last_orders[i]}"
end
