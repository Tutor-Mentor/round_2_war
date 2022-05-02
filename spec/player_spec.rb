require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  subject(:player) { Player.new(name, deck) }
  let(:name) { 'Clarissa' }
  let(:deck) { Deck.new(cards) }
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:cards) { [card1, card2, card3] }

  it "exists" do
    expect(player.name).to eq(name)
    expect(player.deck).to eq(deck)
  end

  describe "#has_lost?" do
    context "when player is initialized" do
      it "returns false" do
        expect(player.has_lost?).to be(false)
      end
    end

    context "when player has no cards left" do
      # let(:remove_card) { player.deck.remove_card }

      it "returns true" do # TODO: refactor
        3.times do
          player.deck.remove_card
        end
        expect(player.has_lost?).to be(true)
      end
    end
  end
end
