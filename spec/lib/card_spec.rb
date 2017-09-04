require "spec_helper"

RSpec.describe Card do
  # Your tests here
  describe "initialize" do
    it "will tell us if we have a card" do
      card = Card.new('king', 'spade')
      expect(card.value).to eq('king')
    end
  end
end
