# -*- coding: utf-8 -*-
# ruby


class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def <<(card)
    self.cards << card
  end

  def clear_hand
    self.cards = []
  end

  def count_points
    points = 0
    ace = 0
    @cards.each do |card|
      if /\d/.match?(card.value)
        points += card.value.to_i
      elsif card.picture?
        points += 10
      elsif card.ace?
        points += 11
      end
      ace += 1 if card.ace?
    end
    ace.times do
      break if points < 22
      points -= 10
    end
    points
  end
end
