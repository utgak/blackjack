# -*- coding: utf-8 -*-
# ruby

require_relative 'player.rb'
require_relative 'hand.rb'
require_relative 'deck.rb'

class Main

  def initialize(name)
    @dealer = Player.new("dealer")
    @dealer.hand = Hand.new
    @player = Player.new(name)
    @player.hand = Hand.new
    @deck = Deck.new
    @name = name
  end


  def start_game
    @deck.renew_deck
    @dealer.hand.clear_hand
    @player.hand.clear_hand
    2.times do
      @dealer.hand << @deck.get_a_card
      @player.hand << @deck.get_a_card
    end
    puts("#{@name} cards is #{@player.hand.icons}points: #{@player.hand.count_points}, money: #{@player.bank}")
    puts("Dealer ** money: #{@dealer.bank}")
    @player.bank -= 10
    @dealer.bank -= 10
    player_step
  end

  def player_step
    puts("Select an action
1. Skip
2. Add card
3. Showdown")
    option = gets.chomp.to_i
    case option
    when 1
      dealer_step
    when 2
      @player.hand << @deck.get_a_card
      puts("#{@name} cards is #{@player.hand.icons }points: #{@player.hand.count_points}")
      dealer_step
    when 3
      dealer_step
    end
  end

  def dealer_step
    @dealer.hand << @deck.get_a_card if @dealer.hand.count_points < 17
    endgame
  end

  def endgame
    puts("Dealer cards is #{@dealer.hand.icons}points: #{@dealer.hand.count_points}")
    if ((@player.hand.count_points > @dealer.hand.count_points) or @dealer.hand.count_points > 21) and @player.hand.count_points <= 21
      @player.bank += 20
      puts("#{@name} won")
    elsif ((@dealer.hand.count_points > @player.hand.count_points) or @player.hand.count_points > 21) and @dealer.hand.count_points <= 21
      @dealer.bank += 20
      puts("Dealer won")
    else
      puts("Draw")
      @dealer.bank += 10
      @player.bank += 10
    end
    continue
  end

  def continue
    puts("do you want to continue? (y/n)")
    option = gets.chomp
    case option
    when "y"
      start_game
    when "n"
      exit(0)
    end
  end
end

puts "Enter your name"
name = gets.chomp
game = Main.new(name)
game.start_game