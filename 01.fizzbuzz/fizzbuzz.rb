# i = 1 ブロック引数だと、不要になる。
20.times do |j| i = j + 1   # |j|以降を追加。0スタートなので+1した。
  if (i % (3 * 5)) == 0
    puts "FizzBuzz"
  elsif (i % 3) == 0
    puts "Fizz"
  elsif (i % 5) == 0
    puts "Buzz"
  else
    puts i
  end
  # i += 1 ブロック引数だと、不要になる。
end
