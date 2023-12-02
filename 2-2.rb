require 'ostruct'



def power(line)
  balls_needed = {red: 0, green: 0, blue: 0}

  line.split(':').last.split(/,|;/).each do |count|
    color = count[/[a-z]+/].to_sym
    balls_needed[color] =  [ count.to_i, balls_needed[color]].max
  end

  balls_needed.values.reduce(:*)
end

sum = open('2.txt').each_line.with_index.filter_map do |line, index|
  power(line)
end.sum

puts sum