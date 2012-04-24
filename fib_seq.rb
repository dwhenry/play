def greater z
  y = 1
  x = 1
  c = 2

  while y.to_s.length < z
    c += 1
    t = x
    x = y
    y = t + x
  end

  return y, c
end

greater 1000