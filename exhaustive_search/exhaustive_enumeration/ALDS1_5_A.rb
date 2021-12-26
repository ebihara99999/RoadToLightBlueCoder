# ref: https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ALDS1_5_A&lang=ja

n = gets.chomp.to_i

list_a = gets.chomp.split(' ').map(&:to_i)

m = gets.chomp.to_i
list_m = gets.chomp.split(' ').map(&:to_i)

list_sum = []
1.upto(n) do |i|
  list_sum << list_a.combination(i).to_a.map(&:sum)
end
list_sum.flatten!.uniq!

list_m.each do |m|
  if list_sum.include? m
    puts 'yes'
  else
    puts 'no'
  end
end
