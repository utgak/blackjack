class Card
  attr_accessor :value, :suit

  def initialize(suit,value)
    @suit = suit
    @value = value
  end

  SUITS = %w[♡ ♢ ♤ ♧]
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]

  def picture?
    /J|Q|K/.match?(@value)
  end

  def ace?
    /A/.match?(@value)
  end
end
