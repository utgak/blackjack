class Player

  attr_accessor :hand, :bank
  attr_reader :name

  def initialize(name)
    @name = name
    @bank = 100
    @hand = []
  end
end
