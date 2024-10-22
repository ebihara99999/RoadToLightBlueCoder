@n = gets.chomp.to_i

@a = gets.chomp.split.map(&:to_i).sort
@b = gets.chomp.split.map(&:to_i).sort

def judge(mid)
  nb = @b.dup
  nb << mid
  nb.sort!
  @n.times do |i|
    return false if @a[i] > nb[i]
  end
  true
end

ok = 1 << 30
ng = 0

unless judge(ok)
  puts '-1'
  exit
end

while ok - ng > 1
  mid = (ok + ng) / 2
  if judge(mid)
    ok = mid
  else
    ng = mid
  end
end

puts ok
