# frozen_string_literal: true

# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_10_A&lang=ja

@memo = []

def fib(n)
  if n.zero?
    1
  elsif n == 1
    1
  else
    if @memo[n].nil?
      @memo[n] = fib(n - 1) + fib(n - 2)
    else
      @memo[n]
    end
  end
end

n = gets.chomp.to_i
puts fib(n)
