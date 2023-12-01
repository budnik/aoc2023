pp open('1.txt').each_line.map{first, *_, last = _1.scan(/\d/);(first+(last||first)).to_i;  }.sum
