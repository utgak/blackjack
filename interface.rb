require_relative 'main.rb'

class Interface

  def set_name
    puts "Enter your name"
    name = gets.chomp
    @game = Main.new(name)
    start_game
  end

  def start_game
    @game.start_game
    puts("#{@game.name} cards is #{@game.player.hand.icons}points: #{@game.player.hand.count_points}, money: #{@game.player.bank}")
    puts("Dealer ** money: #{@game.dealer.bank}")
    player_step
  end

  def player_step
    puts("Select an action
1. Skip
2. Add card
3. Showdown")
    option = gets.chomp.to_i
    @game.player_step(option)
    puts("#{@game.name} cards is #{@game.player.hand.icons }points: #{@game.player.hand.count_points}")
    endgame
  end

  def endgame
    puts("Dealer cards is #{@game.dealer.hand.icons}points: #{@game.dealer.hand.count_points}")
    case @game.endgame
    when :player
      puts("#{@game.name} won")
    when :dealer
      puts("Dealer won")
    when :draw
      puts("Draw")
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

bj = Interface.new
bj.set_name
