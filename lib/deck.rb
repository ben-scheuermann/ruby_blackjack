require_relative 'card'

class Deck
  VALUES = [2, 3, 4, 5, 6, 7 , 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['♦', '♣', '♠', '♥']

  attr_reader :cards
  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    VALUES.each do |value|
      SUITS.each do |suit|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle!
  end

  def initial_hand(player)
    cards = []
    2.times do
      cards << deal(player)
    end
    return cards
  end

  def deal(player) #hit
    card = @cards.pop
    # puts "Player was dealt #{@cards.pop(2)[0].value} of #{@cards.pop(2)[0].suit}"
    puts "#{player} was dealt #{card.to_output}"
    return card
  end
end
