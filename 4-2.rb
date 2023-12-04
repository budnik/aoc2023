require 'json'

@cards = Hash.new{1}

data = open("#{__FILE__[0]}.txt").read

# data ='Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'

@max_card = data.reverse[/:\d+/].reverse.to_i

data.each_line.with_index.each do |line,index|
  
  matches = line.split(/:|\|/)[1..].map(&:split).map!{_1.map!(&:to_i)}.reduce(:&).size


  @cards[index] = @cards[index]

  pp card: (index+1), matches: matches

  (index...index+matches).each { 
    break if _1+1 >= @max_card-1
    @cards[_1+1] += @cards[index]

    pp  incrementing: _1+1, by: @cards[index]  
    pp @cards
  }

  
end

pp @cards
pp @cards.values.sum