def process(t)
  w = t.sort
  r = w.map do |n|
    v = 0
    n.each_char{|c| v += (c[0] - 'A'[0] + 1)}
    v
  end
  puts r[937]
  puts w[937]
  r
end

t = File.read('names.txt').gsub(/"/, '').split(',')
process(t); nil

