# frozen_string_literal: true
# ref: https://atcoder.jp/contests/abc095/tasks/arc096_a

# min aj + bk + cl
# a = 1500
# b = 2000
# c = 1600
# x = 3
# y = 2
# 2l = x + y
# 
# ABが極端に安い場合、ABを多く買い中途半端な分（A or Bのみが余る場合）をA or B を買い足す（余ったとしても）
# ABが極端に高い場合、AB以外を多く買う
# 
# たぶん、ABを買うか A / Bを買うかという選択になる
# 
# まず
# a and b = 3200
# これは
# a + b = 3500より小さい
# したがってabを多く買う。
# 
# もしくは、
# abのみで買う
# a / b で買う
# を比較し
# 
# もし余ったとしても、金額が最小化すれば良いので何も考えなくjて良い
# 
# 同額だったときどうする？ どっちでも良さそう
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
