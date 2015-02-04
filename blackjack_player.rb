require './blackjack'

def blackjack
  puts "Welcome to Blackjack. Press any key to continue."
  gets

  puts "Enter player name:"
  name = gets.chomp

  puts
  deck = Deck.new
  p = Player.new(name)
  dealer = Dealer.new("Dealer")
  players = [p, dealer]
  puts "Shuffling deck."
  sleep 0.5
  deck.shuffle
  puts
  puts "Dealing Cards."
  sleep 1
  puts
  dealer.starting_deal deck, p, dealer
  puts "#{p.name}'s hand: #{p.hand}, value: #{p.value}"
  puts "Dealer is showing: #{dealer.card_showing 0}, value: #{dealer.hand.hand[0].value}"

  scores = {}
  players.each do |player|
    until player.stay? || player.busted?
      player.plays deck, dealer
    end
    if player.busted? 
      puts "#{player.name} busted."
      break
    end
    scores[player.name] = player.hand.value
  end

  if p.busted?
    puts "Dealer wins."
  elsif dealer.busted?
    puts "#{p.name} wins."
  else
    winning_score = 0
    winner = ""
    scores.each do | name, score|
      if score > winning_score
        winning_score = score
        winner = name
      end
    end
    puts "#{winner} wins."
  end
end

blackjack





