require_relative 'spec_helper'

describe Game do
  it 'starts with 12 cards in the spread' do
    g = Game.new
    expect(g._spread.cards.size).to eq 12
  end

  it 'stops play when there are no more cards in the deck and no valid sets in the spread'

  it 'lets play continue when there are cards in the deck'

  it 'lets play continue when there are valid sets in the spread'
end
