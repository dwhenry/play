def divisors(x)
  l = []
  (1..(x/2)).each do |v|
    k = v * 2
    while k <= x
      l[k] ||= []
      l[k] << v
      k += v
    end
  end

  r = {}
  l.each_with_index {|v, i| v.nil? ? nil : r[i] = v.inject{|a, b| a + b}}
  r
end

def find_matches(x)
  d = divisors(x)
  r = []
  d.each do |i, v|
    if v && d[v] && d[v] == i && v != d[v]
      # puts "A: #{d[v]} B: #{v}" unless v == 1
      r << [v, d[v]]
    end
  end
  r
  # d.each_with_index {|v, i| puts "#{i}: #{v}"}
end

def sumed_matches(x)
  find_matches(x).map(&:first). inject{|a, b| a + b}
end

sumed_matches 10000


