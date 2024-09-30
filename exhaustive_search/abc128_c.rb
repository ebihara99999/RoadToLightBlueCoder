# ref: https://atcoder.jp/contests/abc128/tasks/abc128_c

n, m = gets.chomp.split.map(&:to_i)

switches = []
patterns = []
max_digits = n

# 電球とスイッチの接続情報を読み込む
m.times do |mi|
  switches << gets.chomp.split.map(&:to_i)[1..-1]
end

# 電球の点灯条件を読み込む
p_arr = gets.chomp.split.map(&:to_i)

# 全てのスイッチの状態の組み合わせを生成
count = 0
(1 << n).times do |bit|
  all_on = true

  m.times do |i|
    binding.irb
    # スイッチ si がすべて on かつ p の偶奇で点灯確認をする
    on_count = switches[i].count { |s| bit[s - 1] == 1 }
    if on_count % 2 != p_arr[i]
      all_on = false
      break
    end
  end

  count += 1 if all_on
end

# 結果を出力
puts count
