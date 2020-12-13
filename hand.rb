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
      card.each_pair do |suit,point|
        if suit == :♡a or suit == :♢a or suit == :♤a or suit == :♧a
          ace += 1
        end
        points += point
      end
    end
    if points > 21 and ace == 1
      points - 10
    elsif points == 32 and ace == 2
      points - 20
    elsif points > 21 and ace > 1
      points - 10 * (ace - 1)
    else
      points
    end
  end

  def icons
    icons = ""
    @cards.each do |card|
      card.each_key do |key|
        icons << key.to_s + ", "
      end
    end
    icons
  end
end
