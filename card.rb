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
    if /J|Q|K/.match?(@value)
      true
    else
      false
    end
  end

  def ace?
    if /A/.match?(@value)
      true
    else
      false
    end
  end
end
