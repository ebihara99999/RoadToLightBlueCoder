# ref: https://atcoder.jp/contests/joi2009yo/tasks/joi2009yo_d

@m = gets.chomp.to_i # 横
@n = gets.chomp.to_i # 縦

@dx = [1, 0, -1, 0]
@dy = [0, 1, 0, -1]

@field = Array.new(@n, [])

@n.times do |i|
  @field[i] = gets.chomp.split.map(&:to_i)
end

def dfs(x, y, field, depth = 0)
  4.times do |i|
    nx = x + @dx[i]
    ny = y + @dy[i]
    next if nx < 0 || nx >= @m || ny < 0 || ny >= @n
    next if field[ny][nx] == 0

    # seen の代わり
    # 移動する直前じゃないとダメ。一番最初にやってしまうと戻せないケースがあるから
    # 4.times の直後に 0 にすると例えば field[y][x] = 0 のケースで戻せなくなってしまう
    field[y][x] = 0

    # count ではなく depth を渡さないと、適切な場所でカウンター更新ができない
    dfs(nx, ny, field, depth + 1)
    field[y][x] = 1
  end
  @max = [@max, depth + 1].max
end

@max = 0

@n.times do |i|
  @m.times do |j|
    next if @field[i][j] == 0
    dfs(j, i, @field, 0)
  end
end

p @max
