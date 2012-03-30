def palindrome?(number)
  string = number.to_s
  string == string.reverse
end

def find(start)
  x = start
  found = 1
  while true
    # puts "X: #{x}"
    y = start
    while y >= x
      if palindrome?(x * y)
        puts "X: #{x} Y: #{y} P: #{x * y}"
        found += 1
        return if found > 10
      end
      y -= 1
    end
    x -= 1
  end
end

find(999)