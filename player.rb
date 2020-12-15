require_relative 'hand.rb'
class Player

  attr_accessor :hand, :bank
  attr_reader :name

  def initialize(name)
    @name = name
    @bank = 100
    @hand = Hand.new
  end
end
