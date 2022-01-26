# frozen_string_literal: true
# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_A&lang=ja

def fib(n)
  list = Array.new(n, 0)
  list[0] = 1
  list[1] = 1
  return list[n] if n < 2

  (2..n).each do |i|
    list[i] = list[i - 1] + list[i - 2]
  end
  list[n]
end

n = gets.to_i
p fib(n)
