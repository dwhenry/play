def abundent(x)
  l = []
  (1..x).each do |v|
    p = v * 2
    while p <= x
      l[p] ||= []
      l[p] << v
      p += v
    end
  end

  ll = l.map{|v| v ? v.inject{|a, b| a + b} : 0}
  r = []
  ll.each_with_index do |s, i|
    r << i if s > i
  end
  r
end

def non_summed(l)
  v = abundent(l)
  o = []
  v.each do |a|
    v.each do |b|
      o[a + b] = true
    end
  end
  r = []
  o[0..l].each_with_index{|t, i| r << i unless t}
  r.inject{|a, b| a + b}
end

non_summed 28123