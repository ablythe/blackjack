class Card
  def initialize value, suit
    @value = value
    @suit = suit
  end
  def value
    case @value
    when :A 
      @value = 1
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

  attr_reader :suit
end