class Player
  def initialize name
    @name = name
    @hand = Hand.new
    @stayed =false
    @busted = false
  end

  def get_card card
    hand.add card
  end

  attr_reader :name, :hand

  def value
    @hand.value 
  end

  def hit dealer, deck
    puts "#{name} hits"
    c = dealer.deal_one_card deck, self
    puts "#{name} get's a #{c[0].identity}"
    puts "Hand is now: #{hand}, value: #{value}"
  end

  def stay?
    @stayed
  end

  def stay
    @stayed = true
    puts "#{name} stays"
  end

  def busted?
    if value > 21
      @busted = true
    end
    @busted
  end
end

class Dealer < Player

  def starting_deal deck, *players
    players.each do |player|
      card = deal_one_card deck, player
      puts "#{player.name} got a #{card[0].identity}"
      sleep 1
      puts
    end
    players.each do |player|
      card = deal_one_card deck, player
      unless player.name == "Dealer"
        puts "#{player.name} got a #{card[0].identity}"
      end
      sleep 1
      puts
    end
  end

  def deal_one_card deck, player
    card = deck.draw
    player.get_card card
  end

  def plays deck
    if value >= 17
      stay
    else
      hit deck
    end
  end

  def hit deck
    puts "#{name} hits"
    c = deal_one_card deck, self
    puts "#{name} get's a #{c[0].identity}"
    puts "Hand is now: #{hand}, value: #{value}"
    puts 
    sleep 1
  end

  def card_showing n
    hand.hand[n].identity
  end
end


