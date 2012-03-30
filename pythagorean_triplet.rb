
# A = x**2 - y**2
# B = 2*x*y
# C = x**2 + y**2

# 1000 = A + B + C

# 1000 = (x**2 - y**2) + (2*x*y) + (x**2 + y**2)
# 1000 = 2*x**2 + 2*x*y

# 500 = x**2 + x*y

# so solve the above equation where x > y

def x_and_y
  x = 1
  while true
    y = (500 - x**2) / x
    if y < x && (x**2 + x*y) == 500
      puts "X: #{x} Y: #{y}"
      return [x, y]
      break
    end
    x += 1
  end
end

x, y = x_and_y

a = x**2 - y**2
b = 2*x*y
c = x**2 + y**2

puts "A: #{a} B: #{b} C: #{c}"
puts "Result: #{a * b * c}"