class Hand
  def initialize
    @hand =[]
    @value =0
    @busted = false
    @blackjack = false
    @aces = 0
  end

  attr_reader :hand
  
  def value
    @value = 0
    @hand.each do |card|
      @value += card.value
      if card.value == 11 then @aces += 1 end
    end
    while @aces >0 && @value > 21
      @value -= 10
      @aces -= 1
    end
    @value
  end

  def add *cards
    cards.each do |card|
      @hand << card
    end
  end

  def busted?
    if value > 21
      @busted = true
    end
  end

  def blackjack?
    if value == 21
      @blackjack = true
    end
  end

  def to_s
    display = []
    @hand.each do |card|
      value = card.identity[0]
      suit =card.identity[1]
      display << "#{value}#{suit}"
    end
    display.join(', ')
  end


end