class Deck
  def initialize
    @cards = []
    @suits = [:H, :S, :D, :C]
    @drawn_cards = []
  end
  def build_deck
    @suits.each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards
  end
    
  def cards
    if @cards.empty?
      build_deck
    end
    @cards
  end

  def draw
    drawn_card =cards.pop
    @drawn_cards<< drawn_card
    drawn_card
  end

  def drawn
    @drawn_cards
  end
end