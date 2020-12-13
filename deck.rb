class Deck

  attr_accessor :deck

  def initialize
    @deck = []
  end

  SUITS = %w[♡ ♢ ♤ ♧]
  VALUES = %w[1 2 3 4 5 6 7 8 9 10 J Q K A]

  def get_a_card
    self.deck.delete_at(rand(self.deck.size - 1))
  end

  def renew_deck
    VALUES.each do |val|
      SUITS.each do |suit|
        if /A/.match?(val)
          @deck << {"#{suit + val}" => 11}
        elsif /J|Q|k/.match?(val)
          @deck << {"#{suit + val}" => 10}
        elsif /\d/.match?(val)
          @deck << {"#{suit + val}" => val.to_i}
        end
      end
    end
  end
end
