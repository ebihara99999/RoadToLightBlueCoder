# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_11_C&lang=ja

n = gets.chomp.to_i

graph = Array.new(n)
n.times do |i|
  graph[i] = gets.chomp.split.map { |j| j.to_i - 1 }
  graph[i].shift
  graph[i].shift
end


dist = Array.new(n, -1)
queue = Array.new

dist[0] = 0
queue.push 0

while !queue.empty?
  v = queue.shift
  graph[v].each do |nv|
    next if dist[nv] != -1
    dist[nv] = dist[v] + 1
    queue.push nv
  end
end

dist.each_with_index { |d, i| puts "#{i + 1} #{d}\n" }
