require 'bigdecimal'

def detect(v)
  s = v.to_s[2..-1]
  i = 0
  l = s.length
  s.each_char do |c|
    j = i + 1
    while j < l
      n = s.index(c, j)
      if n and n != '0'
        d = n - i
        if s[i..i + d - 1] == s[n..n + d -1]
          return ["0.#{i > 0 ? s[0..i-1] : ''}(#{s[i..i + d - 1]})", d]
        else
          j = n + 1
        end
      else
        j += 1
      end
    end
    i += 1
  end
  [v.to_s, 0]
end

def run(m, p=500, n=10)
  w = (1..m).map do |v|
    a = detect(BigDecimal.new('1', p) / v)
    a + [v]
  end

  w.sort do |a, b|
    b[1] <=> a[1]
  end[0..n]

end

