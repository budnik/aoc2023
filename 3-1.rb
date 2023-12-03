class CharWithCoords < String
  attr_reader :x, :y
  def initialize(c,x,y)
    raise 'Too long!' if c.size != 1
    @x, @y = x, y
    super(c)
  end
end

array = open("#{__FILE__[0]}.txt").each_line.with_index.map { |l, y| l.each_char.with_index.map { |c, x| CharWithCoords.new c, x, y }}

def has_labels?(chunk, array)
  chunk.each do |char|
    n = []
    unless char.y.zero?
      n << array.dig(char.y-1, char.x-1) unless char.x.zero?
      n << array.dig(char.y-1, char.x)
      n << array.dig(char.y-1, char.x+1)
    end

    unless char.x.zero?
        n << array.dig(char.y, char.x-1)
        n << array.dig(char.y+1, char.x-1)
    end

    n << array.dig(char.y+1, char.x)
    n << array.dig(char.y, char.x+1)
    n << array.dig(char.y+1, char.x+1)

    return true if n.any? { _1&.match /[^.0-9\n]/ }
  end
  false
end

result = array.flat_map do |l|
  match = l.chunk { _1.match? /\d/ }
   .filter_map { _1.last if _1.first }
   .select {|chunk| has_labels?(chunk, array)}
   .map(&:join)
   .map(&:to_i)
end.sum

puts result
