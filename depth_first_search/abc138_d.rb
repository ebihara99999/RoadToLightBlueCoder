# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc138/tasks/abc138_d

def dfs(graph, v, pv)
binding.irb
  @counters[v] += @counters[pv] unless pv == -1

  graph[v].each do |e|
    next if e == pv

    dfs(graph, e, v)
  end
end
n, q = gets.chomp.split.map(&:to_i)
graph = Array.new(n) { [] }
(n - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  graph[a - 1] << b - 1
  graph[b - 1] << a - 1
end

@counters = Array.new(n, 0)
q.times do
  v, x = gets.chomp.split.map(&:to_i)
  v -= 1
  @counters[v] += x
end

dfs(graph, 0, -1)
puts @counters.join(' ')
