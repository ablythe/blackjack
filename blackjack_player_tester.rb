require './blackjack'
require 'minitest/autorun'

class TestCard < Minitest::Test
  def test_player_exists
    player = Player.new("Alex")
    assert_equal "Alex", player.name
  end
  def test_dealer_exists
    dealer = Dealer.new("Dealer")
    assert "Dealertron 2000", dealer.name
  end

  def test_deck_shuffles
    deck =Deck.new
    shuffled = deck.shuffle
    refute deck == shuffled
  end

  def test_dealer_can_deal
    d = Deck.new
    dealer = Dealer.new("Dealer")
    dealer.deal d
    assert_equal d.cards.count, 51
  end

  def test_player_can_hit
    d= Deck.new
    player =  Player.new("Alex")
    dealer = Dealer.new("Dealer")
    player.hit dealer, d
    assert_equal d.cards.count, 51
  end

  def test_dealer_can_hit
    d= Deck.new
    dealer = Dealer.new("Dealer")
    dealer.hit dealer, d
    assert_equal d.cards.count, 51
  end


end