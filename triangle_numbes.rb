def primes(x)
  r = []
  r[x] = 1
  (2..x).each do |v|
    if r[v].nil?
      p = v * 2
      while p < x
        r[p] = 1
        p += v
      end
    end
  end
  primes = []
  r.each_with_index do |v, i|
    if v.nil?
      primes << i
    end
  end
  primes
end


def divisors(x)
  m = x
  @primes ||= primes(2000000).select{|a| a > 1}
  l = @primes
  d = {}
  # puts l.inspect
  l.each do |v|
    break if v > x
    # puts "V: #{v}"
    cont_look = true
    while m > 1 && cont_look
      y = m / v
      if y * v == m
        d[v] ||= 0
        d[v] += 1
        m = y
      else
        cont_look = false
      end
    end
  end
  r = 1
  # puts '*' * 10
  puts d.inspect
  d.each do |v, ll|
    r *= (ll + 1)
  end
  r
end

def find(x)
  number = 0
  triangle = 0

  while true
    number += 1
    triangle += number

    d = divisors(triangle)

    puts "Num: #{triangle} Divisors: #{d}"
    return if d >= x
  end
end

find(5)

# {5=>3, 11=>1, 17=>1, 7=>1, 13=>1, 2=>2, 3=>2}
# Num: 76576500 Divisors: 576