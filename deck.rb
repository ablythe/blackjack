class Deck
  def initialize
    @cards = []
    @suits = [:H, :S, :D, :C]
    @drawn = []
    build_deck
  end

  attr_reader :cards, :drawn
  
  def build_deck
    @suits.each do |suit|
      (1..13).each do |value|
        card_rank = case value
        when 1
          :A
        when 13
          :K
        when 12
          :Q
        when 11
          :J
        else
          value
        end
        @cards << Card.new(card_rank, suit)
      end
    end
    @cards
  end

  def draw
    drawn_card =cards.pop
    @drawn<< drawn_card
    drawn_card
  end

  def shuffle
    @cards.shuffle!
  end
end