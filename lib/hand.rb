require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(cardsss)
    @cards = cardsss
    # require "pry"
    # binding.pry
  end

  def score
    hand_score = 0
    card_score = 0
    @cards.each do |card|
      if card.value == 2 || card.value == 3 || card.value == 4 ||
        card.value == 5 || card.value == 6 || card.value == 7 ||
        card.value == 8 || card.value == 9 || card.value == 10
        card_score = card.value
      elsif card.value == 'J' || card.value == 'Q' || card.value == 'K'
        card_score = 10
      elsif card.value == 'A'
        @cards.each do |card|
          if hand_score + 11 > 21
            card_score = 1
          else
            card_score = 11
          end
        end
      end
      hand_score += card_score
    end
    return hand_score
  end
end

# deck = Deck.new
# hand = Hand.new([Card.new(10,"♦"), Card.new("J","♥")])
# require "pry"
# binding.pry
