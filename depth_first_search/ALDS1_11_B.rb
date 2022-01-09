# frozen_string_literal: true

class Node
   def initialize(val, *nodes)
     @val = val 
     @adjacents = nodes
     @visited = false
   end

   def visit
     # do something
   end

   def adjacent
     @nodes
   end

   def visited!
     @visited = true
   end

   def visited?
     @visited
   end
end

def dfs(node)
  node.visit
  node.visited!

  node.adjacents.each do |child|
    unless child.visited?
      dfs child
    end
  end
end

n = gets.chomp.to_i
nodes = []
binding.irb
n.times do
  tmp = gets.chomp.split.map(&:to_i)
  val = tmp.shift 
  degree = tmp.shift
  adjacents = tmp

  nodes << Node.new(val, *adjacents)
end

binding.irb

nodes.each do |node|
  
end
