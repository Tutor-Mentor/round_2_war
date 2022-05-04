class Turn
  attr_accessor :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_deck = @player1.deck
    player2_deck = @player2.deck

    return :basic if player1_deck.rank_of_card_at(0) != player2_deck.rank_of_card_at(0)
    return :mutually_assured_destruction if player1_deck.rank_of_card_at(0) == player2_deck.rank_of_card_at(0) && player1_deck.rank_of_card_at(2) == player2_deck.rank_of_card_at(2)
    return :war if player1_deck.rank_of_card_at(0) == player2_deck.rank_of_card_at(0)
  end

  def winner
    ranks_at_zero = {@player1.deck.rank_of_card_at(0) => @player1, @player2.deck.rank_of_card_at(0) => @player2}
    ranks_at_two = {@player1.deck.rank_of_card_at(2) => @player1, @player2.deck.rank_of_card_at(2) => @player2}
    if type == :basic
      values = ranks_at_zero.keys
      ranks_at_zero[values.max]
    elsif type == :war
      values = ranks_at_two.keys
      ranks_at_two[values.max]
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    
  end
end
