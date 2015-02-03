class Card
  def initialize value, suit
    @value = value
    @suit = suit
    @identity = [value, suit]
  end

  attr_reader :identity, :suit

  def value
    @value = case @value
    when :A 
      11
    when :K, :Q, :J
      10
    else
      @value
    end
  end
end