require_relative 'card.rb'
class Deck

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def get_a_card
    self.cards.delete_at(rand(@cards.size - 1))
  end

  def renew_deck
    Card.values.each do |val|
      Card.suits.each do |suit|
        @cards << Card.new(suit, val)
      end
    end
  end
end
