class Hand
  def initialize
    @hand =[]
    @value =0
    @busted = false
    @blackjack = false
    @aces = 0
    @display = []
  end

  attr_reader :hand

  def add *cards
    cards.each do |card|
      @hand << card
      @value += card.value
      if card.value == 11
        @aces += 1
      end
    end
    while @aces >0 && @value > 21
      @value -= 10
      @aces -= 1
    end
  end

  def value
    @value
  end

  def busted?
    if @value > 21
      @busted = true
    end
    @busted
  end

  def blackjack?
    if @value = 21
      @blackjack = true
    end
  end

  def to_s
    @hand.each do |card|
      @display << "#{card.identity}#{card.suit}"
    end
    @display.join(', ')
  end
end