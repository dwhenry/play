def update(l, v)
  x = if v % 2 == 0
    v / 2
  else
    (v * 3) + 1
  end

  if l[x]
    l[v] = l[x] + 1
  else
    l[v] = update(l, x) + 1
  end
end

def chains(x)
  l = {1 => 1, 2 => 2}
  p = 3
  while p <= x
    update(l, p)
    p += 1
  end
  # puts l.inspect
  m = l.map(&:last).max
  puts m
  puts l.select {|x, y| y == m}.inspect
end

chains 1000000

# [[837799, 525]]