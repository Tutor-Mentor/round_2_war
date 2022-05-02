class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards # TODO: refactor
    rank_of_11_or_higher = []
    @cards.each do |card|
      if card.rank >= 11
        rank_of_11_or_higher.push(card)
      end
    end
    rank_of_11_or_higher
  end

  def percent_high_ranking # TODO: refactor
    result = (high_ranking_cards.size * 100.0) / (@cards.size)
    result.round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards << card
  end
end
