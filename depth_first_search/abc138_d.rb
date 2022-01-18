# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc138/tasks/abc138_d

def dfs(graph, edge, parent, counter)
  @counters[edge] += counter
  graph[edge].each do |e|
    next if e == parent

    dfs(graph, e - 1, parent, counter)
  end
end
n, q = gets.chomp.split.map(&:to_i)
graph = Array.new(n) { [] }
(n - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  graph[a - 1] << b
end

@counters = Array.new(n, 0)
q.times do
  edge, pj = gets.chomp.split.map(&:to_i)
  dfs(graph, edge - 1, edge - 2, pj)
end

puts @counters.join(' ')
