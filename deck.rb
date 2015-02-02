class Deck
  def initialize
    @cards = []
    @suits = [:H, :S, :D, :C]
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
    @cards =@cards.pop
  end
end