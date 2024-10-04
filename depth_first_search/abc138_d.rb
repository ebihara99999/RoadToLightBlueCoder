# ref: https://atcoder.jp/contests/abc138/tasks/abc138_d

n, q = gets.chomp.split.map(&:to_i)

@counters = Array.new(n, 0)
graph = Array.new(n) { [] }

def dfs(graph, v, pv = -1)
  # 初回は前準備で加算しているので何もしない
  @counters[v] += @counters[pv] unless pv == -1

  graph[v].each do |nv|
    # 親ノードには戻らない
    next if pv == nv
    dfs(graph, nv, v)
  end
end

(n-1).times do
  a, b = gets.chomp.split.map(&:to_i)
  graph[a - 1] << b - 1
  graph[b - 1] << a - 1
end

q.times do |i|
  v, x = gets.chomp.split.map(&:to_i)
  # 前準備 親ノードに対しすべてのクエリを実行する
  @counters[v - 1] += x
end
dfs(graph, 0, -1)

puts @counters.join(' ')
