require 'ostruct'
@lim = OpenStruct.new(red: 12, green: 13, blue: 14)


def posible?(line)
  line.split(':').last.split(/,|;/).each do |count|
    return false if @lim.send(count[/[a-z]+/]) < count.to_i
  end

  true
end

sum = open('2.txt').each_line.with_index.filter_map do |line, index|
  posible?(line) && index+1 
end.sum

puts sum