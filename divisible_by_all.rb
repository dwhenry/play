
# This approach would work and the code is clean..
# it just takes a long tim e to calculate
def multiples(x)
  r = []
  max = (2..x).inject(1) {|a, b| a * b}
  (2..x).each do |v|
    p = v
    while p < max
      r[p] ||= 0
      r[p] += 1
      p += v
    end
  end
  m = []
  r.each_with_index do |v, i|
    m << [i, v]
  end
  m.detect{|a, s| s == x - 1}
end


# f = multiples(10)

def primes(x)
  r = []
  max = (x ** 0.5) + 1
  r[max] = 1
  (2..max).each do |v|
    if r[v].nil?
      p = v * 2
      while p < max
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

def process(x)
  # get the prime numbers
  l = primes(x * x)
  l.delete(1)

  # determine which numbers are multiple of primes and can be ignored
  # from the total set of numbers (primes must be included)
  a = []
  l.each do |v|
    (l - [v]).each do |w|
      if v * w <= x
        a << (v * w)
      end
    end
  end

  # remove any which are not direct mutliples of primes
  # but are multiple of values in the remaining set where the
  # multiples are not multiple of themselves
  # i.e. [12, 3, 4] => [3, 4]
  #      [8, 4, 2] => [8, 4, 2] (as 4 is 2 * 2..)
  b = ((2..x).map -  a)
  g = []
  b.each do |o|
    (b - [o]).each do |e|
      r = o / e
      if (r < e) && (r * e == o)
        q = e / r
        if q * r != e
          g << o
        end
      end
    end
  end

  # remove any number which are divisors of values in
  # the remaining set
  # so for [2, 3, 8] => [3, 8]
  k = b -  g
  u = []
  k.each do |j|
    (k - [j]).each do |i|
      n = j / i
      if i * n == j
        u << i
      end
    end
  end

  # multiple your set
  (k - u).inject{|a,b| a * b}
end

puts process(10)

puts process(20)
