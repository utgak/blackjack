# -*- coding: utf-8 -*-
# ruby


class Game
  attr_accessor :name, :dealer_cards, :player_cards, :player_bank, :dealer_bank

  def initialize
    @name = ""
    @player_cards = []
    @dealer_cards = []
    @player_bank = 100
    @dealer_bank = 100
    @deck = []
  end

  def icons(cards)
    icons = ""
    cards.each do |card|
      card.each_key do |key|
        icons << key.to_s + ", "
      end
    end
    icons
  end


  def start_game
    @player_cards = []
    @dealer_cards = []
    renew_deck
    2.times do
      self.player_cards << get_a_card
      self.dealer_cards << get_a_card
    end
    @player_bank -= 10
    @dealer_bank -= 10
  end

  def player_step(option)
    case option
    when 1
      dealer_step
    when 2
      self.player_cards << get_a_card
      dealer_step
    when 3
      dealer_step
    end
  end

  def dealer_step
    @dealer_cards << get_a_card if count_points(@dealer_cards) < 17
  end

  def endgame
    if (count_points(@player_cards) > count_points(@dealer_cards) or count_points(@dealer_cards) > 21) and count_points(@player_cards) <= 21
      @player_bank += 20
      :player
    elsif (count_points(@dealer_cards) > count_points(@player_cards) or count_points(@player_cards) > 21) and count_points(@dealer_cards) <= 21
      @dealer_bank += 20
      :dealer
    else
      @dealer_bank += 10
      @player_bank += 10
      :draw
    end
  end

  def get_a_card
    @deck.delete_at(rand(@deck.size - 1))
  end

  def renew_deck
    @deck = [
      {:♡2 => 2}, {:♡3 => 3},{:♡4 => 4},{:♡5 => 5},{:♡6 => 6},{:♡7 => 7},{:♡8 => 8},{:♡9 => 9},{:♡10 => 10},{:♡j => 10},{:♡q => 10}, {:♡k => 10}, {:♡a => 11},
      {:♢2 => 2}, {:♢3 => 3},{:♢4 => 4},{:♢5 => 5},{:♢6 => 6},{:♢7 => 7},{:♢8 => 8},{:♢9 => 9},{:♢10 => 10},{:♢j => 10},{:♢q => 10}, {:♢k => 10}, {:♢a => 11},
      {:♤2 => 2}, {:♤3 => 3},{:♤4 => 4},{:♤5 => 5},{:♤6 => 6},{:♤7 => 7},{:♤8 => 8},{:♤9 => 9},{:♤10 => 10},{:♤j => 10},{:♤q => 10}, {:♤k => 10}, {:♤a => 11},
      {:♧2 => 2}, {:♧3 => 3},{:♧4 => 4},{:♧5 => 5},{:♧6 => 6},{:♧7 => 7},{:♧8 => 8},{:♧9 => 9},{:♧10 => 10},{:♧j => 10},{:♧q => 10}, {:♧k => 10}, {:♧a => 11},
    ]
  end


  def count_points(cards)
    points = 0
    ace = 0
    cards.each do |card|
      card.each_pair do |suit,point|
        if suit == :♡a or suit == :♢a or suit == :♤a or suit == :♧a
          ace += 1
        end
        points += point
      end
    end
    if points > 21 and ace == 1
      points - 10
    elsif points > 21 and ace > 1
      points - 10 * (ace - 1)
    else
      points
    end
  end
end
