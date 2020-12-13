class Player
  attr_accessor :hand, :bank

  def initialize(name)
    @name = name
    @bank = 100
  end
end
