class Hand
  def initialize
    @hand =[]
    @value =0
  end

  attr_reader :hand

  def add *cards
    cards.each do |card|
      hand.push card
      @value += card.value
    end
  end

  def value
    @value
  end
end