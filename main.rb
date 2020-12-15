# -*- coding: utf-8 -*-
# ruby

require_relative 'player.rb'
require_relative 'hand.rb'
require_relative 'deck.rb'
require_relative 'card.rb'

class Main
  attr_reader :name, :player, :deck, :dealer

  def initialize(name)
    @dealer = Player.new("dealer")
    @player = Player.new(name)
    @deck = Deck.new
  end


  def start_game
    @deck.renew_deck
    @dealer.hand.clear_hand
    @player.hand.clear_hand
    2.times do
      @dealer.hand << @deck.get_a_card
      @player.hand << @deck.get_a_card
    end
    @player.bank -= 10
    @dealer.bank -= 10
  end

  def player_step(option)
    case option
    when 1
      dealer_step
    when 2
      @player.hand << @deck.get_a_card
      dealer_step
    when 3
      dealer_step
    end
  end

  def dealer_step
    @dealer.hand << @deck.get_a_card if @dealer.hand.count_points < 17
  end

  def endgame
    if ((@player.hand.count_points > @dealer.hand.count_points) or @dealer.hand.count_points > 21) and @player.hand.count_points <= 21
      @player.bank += 20
      :player
    elsif ((@dealer.hand.count_points > @player.hand.count_points) or @player.hand.count_points > 21) and @dealer.hand.count_points <= 21
      @dealer.bank += 20
      :dealer
    else
      @dealer.bank += 10
      @player.bank += 10
      :draw
    end
  end
end
