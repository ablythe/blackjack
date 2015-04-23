class Dealer
  def initialize
    @name = "Dealertron 2000"
    @hand = Hand.new
  end

  attr_reader :name
  def hand
    @hand.hand
  end
  
  def deal deck, faceup
    card = deck.draw
  end

end