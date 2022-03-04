# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=GRL_1_A&lang=ja

v, e, r = gets.chomp.split.map(&:to_i)
graph = Array.new(e) { Array.new(v, []) }
dist = Array.new(v, Float::INFINITY)
e.times do
  s, t, d = gets.chomp.split.map(&:to_i)
  graph[s] << [t, d]
end
pq = []
pq << [0, r]

until pq.empty?
  pq.sort!
  dist_s, s = pq.pop
  next if dist[s] < dist_s

  graph[s].each do |ss|
    t, d = ss
    dist_t = dist_s + d

    if dist[t] > dist_t
      dist[t] = dist_t
      pq.push([dist_t, t])
    end
  end
end
dist[r] = 0
dist.map! { |d| d == Float::INFINITY ? 'INF' : d }
puts dist
