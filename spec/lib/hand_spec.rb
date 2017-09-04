require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([Card.new(10,"♦"), Card.new("J","♥")]) }

  describe "#score" do
    it "computes the hands score" do
      expect(hand.score).to eq(20)
    end
    it "works with an ACE as 11" do
      second_hand = Hand.new([Card.new('A', 'spade'), Card.new(10, 'heart')])
      expect(second_hand.score).to eq(21)
    end
    it "passes with ACE as 1" do
      third_hand = Hand.new([Card.new('A', 'spade'), Card.new(10, 'Diamond'), Card.new(7, 'spade')])
      expect(third_hand.score).to eq(18)
    end
  end

  describe "#hit" do
    it "tells us if #hit is working" do

      deck = Deck.new
      hand = Hand.new(deck)
      hand.hit
      expect(hand.hand_array.size).to eq(1)
    end
  end
end
