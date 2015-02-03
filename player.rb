class Player
  def initialize name
    @name = name
    @hand = Hand.new
    @stayed =false
    @busted = false
  end
  
  attr_reader :name, :hand
  
  def get_card card
    hand.add card
  end

  def value
    @hand.value 
  end

  def hit dealer, deck
    puts "#{name} hits"
    puts
    sleep 1
    c = dealer.deal_one_card deck, self
    puts "#{name} get's a #{c[0].identity}"
    puts "Hand is now: #{hand}, value: #{value}"
    sleep 1
  end

  def stay?
    @stayed
  end

  def stay
    @stayed = true
    puts "#{name} stays with #{value}"
    puts
    sleep 1
  end

  def busted?
    if value > 21
      @busted = true
    end
    @busted
  end

  def plays deck, dealer
    puts
    puts "Do you want hit or stay? "
    play = gets.chomp.downcase
    if play == "hit"
      hit dealer, deck
    else stay
    end
  end
end

class Dealer < Player

  def starting_deal deck, *players
    card_number = 0
    2.times do 
      card_number += 1
      players.each do |player|
        card = deal_one_card deck, player
        unless player.name == "Dealer" && card_number == 2
          puts "#{player.name} got a #{card[0].identity}"
        end
        sleep 1
        puts
      end
    end
  end

  def deal_one_card deck, player
    card = deck.draw
    player.get_card card
  end

  def plays deck, dealer
    if value >= 17
      stay
      sleep 1
    else
      hit self, deck
      puts
      sleep 1
    end
  end

  def card_showing n
    hand.hand[n].identity
  end
end


