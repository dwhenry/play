require 'date'

def offsets_normal
  offsets = []
  offset = 0
  [
    31, 28, 31,
    30, 31, 30,
    31, 31, 30,
    31, 30, 31
  ].each do |days|
    offsets << ((7 - offset) % 7)
    offset = (offset + days) % 7
  end
  offsets
end

def offsets_leap
  offsets = []
  offset = 0
  [
    31, 29, 31,
    30, 31, 30,
    31, 31, 30,
    31, 30, 31
  ].each do |days|
    offsets << ((7 - offset) % 7)
    offset = (offset + days) % 7
  end
  offsets
end

def sundays(start_year, end_year)
  e = end_year
  y = start_year

  n = {}
  l = {}
  while y <= e
    s = Date.parse("#{y}-01-01").wday
    begin
      Date.parse("#{y}-02-29").wday
      l[s] ||= 0
      l[s] += 1
    rescue
      n[s] ||= 0
      n[s] += 1
    end
    y += 1
  end

  c = 0
  offsets_normal.each do |i|
    c += n[i] if n[i]
  end

  offsets_leap.each do |i|
    c += l[i] if l[i]
  end

  c
end

sundays 1901, 2000
# sundays 2000, 2000

# 171


def long(start_year, end_year)
  s = start_year
  c = 0
  while s <= end_year
    for i in 1..12
      if Date.parse("#{s}-#{i}-01").wday == 0
        c += 1
      end
    end
    s += 1
  end
  c
end

long 1901, 2000
