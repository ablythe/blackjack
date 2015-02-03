class Deck
  def initialize
    @cards = []
    @suits = [:H, :S, :D, :C]
    @drawn_cards = []
    build_deck
  end

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

  def cards
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

  def shuffle
    @cards.shuffle!
  end
end