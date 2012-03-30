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

primes(2000000)[2..-1].inject{|a,b| a + b}

