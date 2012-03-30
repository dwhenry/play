def size(x)
  singles = [
    [/10$/,  'ten'],

    [/11$/, 'eleven'],
    [/12$/,  'twelve'],
    [/13$/,  'thirteen'],
    [/14$/,  'fourteen'],
    [/15$/,  'fifteen'],
    [/16$/,  'sixteen'],
    [/17$/,  'seventeen'],
    [/18$/,  'eighteen'],
    [/19$/,  'nineteen'],

    [/1$/,  'one'],
    [/2$/, 'two'],
    [/3$/, 'three'],
    [/4$/, 'four'],
    [/5$/, 'five'],
    [/6$/, 'six'],
    [/7$/, 'seven'],
    [/8$/, 'eight'],
    [/9$/, 'nine'],

    [/1000$/, 'one thousand']
  ]
  doubles = {
    /2.$/ => 'twenty',
    /3.$/ => 'thirty',
    /4.$/ => 'forty',
    /5.$/ => 'fifty',
    /6.$/ => 'sixty',
    /7.$/ => 'seventy',
    /8.$/ => 'eighty',
    /9.$/ => 'ninety'
  }

  anders = {
    /1..$/ => 'one hundred',
    /2..$/ => 'two hundred',
    /3..$/ => 'three hundred',
    /4..$/ => 'four hundred',
    /5..$/ => 'five hundred',
    /6..$/ => 'six hundred',
    /7..$/ => 'seven hundred',
    /8..$/ => 'eight hundred',
    /9..$/ => 'nine hundred'
  }

  v = x.to_s
  o = ''
  singles.each do |r, s|
    if v =~ r
      o += s
      break
    end
  end

  doubles.each do |r, s|
    if v =~ r
      o += s
      break
    end
  end

  anders.each do |r, s|
    if v =~ r
      if o == ''
        o += s
      else
        o += s
        o += 'and'
      end
    end
  end
  puts o
  o.gsub(/ /, '').size
end

(1..1000).map{|a| size(a)}.inject{|b, c| b + c}