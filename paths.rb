
def down(x, y, s, c)
  x += 1
  return c[[x, y]] if c[[x, y]]
  return 1 if x == s && y == s
  return 0 if x > s
  t = down(x, y, s, c) + left(x, y, s, c)
  c[[x, y]] = t
end

def left(x, y, s, c)
  y += 1
  return c[[x, y]] if c[[x, y]]
  return 1 if x == s && y == s
  return 0 if y > s
  t = down(x, y, s, c) + left(x, y, s, c)
  c[[x, y]] = t
end

def paths(s)
  x = y = 0
  c = {}
  down(x, y, s, c) + left(x, y, s, c)
end

paths 2

paths 20
# 137846528820