class Card

  attr_accessor :value, :suit

  def initialize(suit)
    @suit = suit
    @value = self.card_value
  end

  def card_value
    if /\d/.match?(@suit)
      suit.delete_prefix(suit[0]).to_i
    elsif self.picture?
      10
    elsif self.ace?
      11
    end
  end

  def picture?
    if /J|Q|K/.match?(@suit)
      true
    else
      false
    end
  end

  def ace?
    if /A/.match?(@suit)
      true
    else
      false
    end
  end
end
