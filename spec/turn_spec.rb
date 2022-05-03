require 'rspec' # 7:30pm 5/2/22 start again
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  subject(:turn) { Turn.new(player1, player2) }

  it "exists" do
    expect(turn.player1).to be(player1)
    expect(turn.player2).to be(player2)
    # expect(turn.spoils_of_war).to be(player2)
  end

  context ":basic" do
    # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
  end

  context ":war" do
    # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
  end

  context ":mutually_assured_destruction" do
    # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
  end

  describe "#winner" do # determines winner of the turn
#     if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.
  end

  describe "#pile_cards" do # cards are sent from player's deck into @spoils_of_war based on rules:
    #   for a :basic turn, each player will send one card (the top card) to the spoils pile
    # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
    # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
  end

  describe "#award_spoils" do
    # this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
  end
end
