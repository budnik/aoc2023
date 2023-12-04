result = open("#{__FILE__[0]}.txt").each_line.map do |line|
  matches = line.split(/:|\|/)[1..].map(&:split).map!{_1.map!(&:to_i)}.reduce(:&)

  next 0 if matches.empty?

  2**(matches.count-1)
end.sum

pp result