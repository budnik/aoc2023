dict = { 
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}

lambda = ->(digit){ dict[digit]&.to_s || digit }

regexp = /(\d)|(?=(#{Regexp.union(dict.keys)}))/
pp open('1.txt').each_line.with_index.map{first, *_, last = _1.scan(regexp).flatten.compact;first=lambda[first]; (first+(lambda[last]||first)).to_i;  }.sum
