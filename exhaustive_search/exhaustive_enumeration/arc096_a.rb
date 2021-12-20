# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc095/tasks/arc096_a

# memo: 他の人の回答見たら、aとbだけで買う価格、abと残りを買う価格を配列に入れ最小値を出す方が良さそうだった
a, b, c, x, y = gets.chomp.split(' ').map(&:to_i)
price = 0
if a + b < 2 * c
  # ABが高い場合
  price = a * x + b * y
else
  # ABが同額もしくは安い
  if x == y
    price = x * 2 * c
  else
    # 差がある場合、ABだけで買うのかA or Bだけで買うのか判断が必要
    # まず少ない方の枚数分だけABを買う
    amount = x < y ? x : y
    price = 2 * amount * c

    diff = (x - y).abs
    if amount == x
      # xが少ないのでyを買う
      price_b = b * diff
      price_ab = 2 * c * diff
      price += price_b < price_ab ? price_b : price_ab
    else
      # yが少ないのでxを買う
      price_a = a * diff
      price_ab = 2 * c * diff
      price += price_a < price_ab ? price_a : price_ab
    end
  end
end

puts price
