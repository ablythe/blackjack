class Card
  def initialize value, suit
    @value = value
    @suit = suit
    @identity = value
  end
  def value
    case @value
    when :A 
      @value = 11
    when :K
      @value = 10
    when :Q
      @value = 10
    when :J
      @value = 10
    else
      @value = @value
    end
  end

  attr_reader :identity

  attr_reader :suit
end