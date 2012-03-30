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

def mm(x)
  primes(x).reverse.detect do |p|
    v = x / p
    if v * p == x
      puts p
      break
    end
  end
end

mm(600851475143)