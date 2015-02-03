require './blackjack'

#Starting game
deck = Deck.new
p = Player.new("Alex")
dealer = Dealer.new("Dealer")
#shuffling
deck.shuffle

#Dealing
dealer.starting_deal deck, p, dealer
puts "#{p.name}'s hand: #{p.hand}, value: #{p.value}"
puts "Dealer is showing: #{dealer.card_showing 0}, value: #{dealer.hand.hand[0].value}"


until p.stay? || p.busted?
  puts "Do you want hit or stay? "
  play = gets.chomp.downcase
  if play == "hit"
    p.hit dealer, deck
  else p.stay
  end
end
if p.busted? 
  puts "You Busted." 
else
  #Computer plays
  until dealer.stay? || dealer.busted?
    dealer.plays deck
  end 
  if dealer.busted?
    puts "Dealer busts. #{p.name} wins!"
  else
    winner = if p.value > dealer.value
      p
    else
      dealer
    end
    puts "#{winner.name} wins."
  end
end





#Deck
#Deal
#Moves
  #Check for bust after each
#Declare Winner
