require_relative 'game.rb'
class Main
  def initialize
    @game = Game.new
  end

  def set_name
    puts "Enter your name"
    @game.name = gets.chomp
  end

  def new_game
    @game.start_game

    puts("dealer cards: #{"*" * @game.dealer_cards.size}, money: #{@game.dealer_bank}")

    puts("#{@game.name} cards is #{@game.icons(@game.player_cards)}points: #{@game.count_points(@game.player_cards)}, money: #{@game.player_bank}")

    puts("Select an action
1. Skip
2. Add card
3. Showdown")

    option = gets.chomp.to_i
    @game.player_step(option)
    puts("#{@game.name} cards is #{@game.icons(@game.player_cards)}points: #{@game.count_points(@game.player_cards)}") if option == 2


    case @game.endgame
    when :player
      puts("Dealer cards is #{@game.icons(@game.dealer_cards) }points: #{@game.count_points(@game.dealer_cards)}")
      puts("#{@game.name} won")
    when :dealer
      puts("Dealer cards is #{@game.icons(@game.dealer_cards) }points: #{@game.count_points(@game.dealer_cards)}")
      puts("Dealer won")
    when :draw
      puts("Draw")
      puts("Dealer cards is #{@game.icons(@game.dealer_cards) }points: #{@game.count_points(@game.dealer_cards)}")
    end

    puts("do you want to continue? (y/n)")
    option = gets.chomp
    case option
    when "y"
      new_game
    when "n"
      exit(0)
    end
  end
end

black_jack = Main.new
black_jack.set_name
black_jack.new_game
