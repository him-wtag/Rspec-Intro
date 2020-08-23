class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

RSpec.describe Card do
  it 'has a rank & suit' do
    card = Card.new('Ace', 'Spades')
    expect(card.rank).to eq('Ace')
    expect(card.suit).to eq('Spades')
  end
end
