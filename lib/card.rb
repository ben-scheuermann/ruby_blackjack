class Card
  # Your code here
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_output
    "#{value} of #{suit}"
  end
end
