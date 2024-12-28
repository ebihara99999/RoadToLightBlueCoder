arr = gets.split.map(&:to_i).sort

if arr.uniq.size == 1
  puts 'No'
elsif arr[0] == arr[1] && arr[1] == arr[2] || arr[1] == arr[2] && arr[2] == arr[3]
  puts "Yes"
elsif arr[0] == arr[1] && arr[2] == arr[3]
  puts "Yes"
else
  puts "No"
end
