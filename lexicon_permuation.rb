def get_list(v, max=3)
  a = [1]
  b = 2
  while a.inject(b) {|c, b| c * b} <= v && b <= max
    a << b
    b += 1
  end
  a
end


def get_lists(v, max)
  l = []
  while v > 0
    s = get_list(v, max)
    v -= s.inject{|a, b| a * b}
    l << s
  end
  l
end


def get(v, max)
  l = get_lists(v, max)
  l.group_by{|f| f.size}.map{|a, b| [a, b.size]}
end

def number(v, max)
  l = get(v-1, max)

  r = (0..max).map(&:to_i)
  d = []
  l.each do |s, c|
    d << r.delete_at(c)
  end
  d + r
end

number(1_000_000, 9).join


