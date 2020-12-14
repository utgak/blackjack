require_relative 'card.rb'
require_relative 'hand.rb'
class Deck

  attr_accessor :deck

  def initialize
    @deck = []
  end

  SUITS = %w[♡ ♢ ♤ ♧]
  VALUES = %w[1 2 3 4 5 6 7 8 9 10 J Q K A]

  def get_a_card
    Card.new(self.deck.delete_at(rand(@deck.size - 1)))
  end

  def renew_deck
    VALUES.each do |val|
      SUITS.each do |suit|
        @deck << suit + val
      end
    end
  end
end
