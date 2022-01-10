# frozen_string_literal: true

class Node
  attr_accessor :seen_at, :visited_at
  attr_reader :val, :adjacent_ids

  @@time = 0
  @@nodes = []

  def initialize(val, *adjacent_ids)
    @val = val
    @adjacent_ids = adjacent_ids
    @seen_at = 0
    @visited_at = 0
  end

  def visited?
    !visited_at.zero?
  end

  def seen?
    !seen_at.zero?
  end

  def self.dfs(node)
    @@time += 1
    node.visited_at = @@time

    node.adjacent_ids.each do |id|
      child = @@nodes.select { |adj| adj.val == id }.first
      child.seen_at = @@time unless child.seen?
      dfs(child) unless child.visited?
    end
  end

  def self.nodes
    @@nodes
  end

  def self.add_nodes(node)
    @@nodes << node
  end
end

n = gets.chomp.to_i
n.times do
  tmp = gets.chomp.split.map(&:to_i)
  val = tmp.shift
  _ = tmp.shift
  adjacent_ids = tmp

  Node.add_nodes Node.new(val, *adjacent_ids)
end

Node.nodes.each do |node|
  Node.dfs(node)
end

Node.nodes.each do |node|
  puts "#{node.val} #{node.seen_at} #{node.visited_at}"
end
