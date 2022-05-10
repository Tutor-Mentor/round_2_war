class Game
  class << self

    def start
      setup_game
      
    end

    def create_cards
      cards = [
        Card.new(:club, 'Ace', 1),
        Card.new(:club, '2', 2),
        Card.new(:club, '3', 3),
        Card.new(:club, '4', 4),
        Card.new(:club, '5', 5),
        Card.new(:club, '6', 6),
        Card.new(:club, '7', 7),
        Card.new(:club, '8', 8),
        Card.new(:club, '9', 9),
        Card.new(:club, '10', 10),
        Card.new(:club, 'Jack', 11),
        Card.new(:club, 'Queen', 12),
        Card.new(:club, 'King', 13),
        Card.new(:diamond, 'Ace', 1),
        Card.new(:diamond, '2', 2),
        Card.new(:diamond, '3', 3),
        Card.new(:diamond, '4', 4),
        Card.new(:diamond, '5', 5),
        Card.new(:diamond, '6', 6),
        Card.new(:diamond, '7', 7),
        Card.new(:diamond, '8', 8),
        Card.new(:diamond, '9', 9),
        Card.new(:diamond, '10', 10),
        Card.new(:diamond, 'Jack', 11),
        Card.new(:diamond, 'Queen', 12),
        Card.new(:diamond, 'King', 13),
        Card.new(:spade, 'Ace', 1),
        Card.new(:spade, '2', 2),
        Card.new(:spade, '3', 3),
        Card.new(:spade, '4', 4),
        Card.new(:spade, '5', 5),
        Card.new(:spade, '6', 6),
        Card.new(:spade, '7', 7),
        Card.new(:spade, '8', 8),
        Card.new(:spade, '9', 9),
        Card.new(:spade, '10', 10),
        Card.new(:spade, 'Jack', 11),
        Card.new(:spade, 'Queen', 12),
        Card.new(:spade, 'King', 13),
        Card.new(:heart, 'Ace', 1),
        Card.new(:heart, '2', 2),
        Card.new(:heart, '3', 3),
        Card.new(:heart, '4', 4),
        Card.new(:heart, '5', 5),
        Card.new(:heart, '6', 6),
        Card.new(:heart, '7', 7),
        Card.new(:heart, '8', 8),
        Card.new(:heart, '9', 9),
        Card.new(:heart, '10', 10),
        Card.new(:heart, 'Jack', 11),
        Card.new(:heart, 'Queen', 12),
        Card.new(:heart, 'King', 13),
      ]
    end

    def shuffle_cards(cards)
      p "Shuffling the cards..."
      cards.shuffle!
    end

    def deal_cards(cards)
      p 'Assigning cards...'
      @deck1 = Deck.new(cards.slice!(0..25))
      @deck2 = Deck.new(cards.slice!(0..25))
    end

    def create_players(deck1, deck2)
      p "Creating today's player's"
      @player1 = Player.new('Megan', deck1)
      @player2 = Player.new('Aurora', deck2)
    end

    def setup_game
      cards = shuffle_cards(create_cards)
      sleep(2)
      deal_cards(cards)
      sleep(2)
      create_players(@deck1, @deck2)
      sleep(2)
    end
  end
end
