class Card
  attr_accessor :value, :suit
  class << self; attr_reader :suits, :values end

  @suits = %w[♡ ♢ ♤ ♧]
  @values = %w[1 2 3 4 5 6 7 8 9 10 J Q K A]

  def initialize(suit,value)
    @suit = suit
    @value = value
  end

  def picture?
    /J|Q|K/.match?(@value)
  end

  def ace?
    /A/.match?(@value)
  end
end
