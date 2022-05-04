require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  subject(:turn) { Turn.new(player1, player2) }
  let(:card1) { Card.new(:heart, 'Jack', 11) }
  let(:card2) { Card.new(:heart, '10', 10) }
  let(:card3) { Card.new(:heart, '9', 9) }
  let(:card4) { Card.new(:diamond, 'Jack', 11) }
  let(:card5) { Card.new(:heart, '8', 8) }
  let(:card6) { Card.new(:diamond, 'Queen', 12) }
  let(:card7) { Card.new(:heart, '3', 3) }
  let(:card8) { Card.new(:diamond, '2', 2) }
  let(:deck1) { Deck.new([card1, card2, card5, card8]) }
  let(:deck2) { Deck.new([card3, card4, card6, card7]) }
  let(:player1) { Player.new("Megan", deck1) }
  let(:player2) { Player.new("Aurora", deck2) }

  # shared_context ":war" do
  #   let(:deck2) { Deck.new([card4, card3, card6, card7]) }
  # end

  it "exists" do
    expect(turn.player1).to be(player1)
    expect(turn.player2).to be(player2)
    expect(turn.spoils_of_war).to eq([])
  end

  describe "#winner" do
    # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
    context ":basic" do
      # if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
      describe "rank_of_card_at(0) from the players’ decks are not the same rank" do
        it "returns player with higher rank_of_card_at(0)" do
          expect(turn.type).to eq(:basic)
          expect(turn.winner).to be(player1)
        end
      end
    end

    context ":war" do
      # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
      let(:card3) { Card.new(:spade, 'Jack', 11) }
      # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
      describe "when both players' rank_of_card_at(0) are the same" do
        it "returns player with the higher rank_of_card_at(2)" do
          expect(turn.type).to eq(:war)
          expect(turn.winner).to be(player2)
        end
      end
    end

    context ":mutually_assured_destruction" do
      let(:card3) { Card.new(:spade, 'Jack', 11) }
      let(:card6) { Card.new(:spade, '8', 8) }
      # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.

      describe "when both players' rank_of_card_at(0) and rank_of_card_at(2) are the same" do
        # if the turn has a type of :mutually_assured_destruction the method will return No Winner.
        it "returns 'No Winner'" do
          message = 'No Winner'
          expect(turn.type).to eq(:mutually_assured_destruction)
          expect(turn.winner).to eq(message)
        end
      end
    end
  end

  describe "#pile_cards" do # cards are sent from player's deck into @spoils_of_war based on rules:
    context ":basic" do
      #   for a :basic turn, each player will send one card (the top card) to the spoils pile
      it "each player will send one card (the top card) to the spoils pile" do
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
      end
    end

    context ":war" do
      # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
      let(:card3) { Card.new(:spade, 'Jack', 11) }
      it "each player will send three cards (the top three cards) to the spoils pile" do
        turn.pile_cards
        expect(turn.spoils_of_war).to include(card1, card2, card3, card4, card5, card6)
      end
    end

    context ":mutually_assured_destruction" do
      # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). T
      it "each player will remove three cards from play (the top three cards in their deck)" do
        # These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
        turn.pile_cards
        expect(turn.spoils_of_war).to_not include(card1, card2, card3, card4, card5, card6)
        expect(turn.spoils_of_war).to eq([])
      end
    end
  end

  describe "#award_spoils" do
    # this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
    it "adds each of the cards in the @spoils_of_war array to the winner of the turn" do
      winner = turn.winner
      turn.award_spoils(winner)
      expect(player1.deck).to include(card1, card3)
    end
  end
end
