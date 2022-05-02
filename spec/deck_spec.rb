require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  subject(:deck) { Deck.new(cards) }
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:cards) { [card1, card2, card3] }
  let(:remove_card) { deck.remove_card }

  it "exists" do
    expect(deck.cards).to eq(cards)
  end

  describe "#rank_of_card_at" do
    it "returns the rank of card at provided index" do
      expect(deck.rank_of_card_at(0)).to eq(card1.rank)
      expect(deck.rank_of_card_at(2)).to eq(card3.rank)
    end
  end

  describe "#high_ranking_cards" do
    it "returns array of cards in deck with rank of 11 or more" do
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe "#percent_high_ranking" do
    it "returns percentage of cards that are high ranking" do
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe "#remove_card" do
    it "removes rop card from the deck" do
      # removes card at index 0 aka first card created
      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq([card2, card3])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end

  describe "#add_card" do
    subject(:add_card) { deck.add_card(card4) }
    let(:card4) { Card.new(:club, '5', 5) }

    it "adds one card to the bottom (end) of the deck" do
      remove_card
      add_card
      expect(deck.cards).to eq([card2, card3, card4])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(33.33)
    end
  end
end
