require_relative 'spec_helper'

describe Game do
	let(:g) {Game.new}

  it 'starts with full deck minus spread' do
    expect(g.deck.cards.size).to eq(81 - 12)
    expect(g.spread.cards.size).to eq 12
  end

  it 'stops play when there are no more cards in the deck and no valid sets in the spread' do
  	first_spread_view = g.play 
  end

  it 'lets play continue when there are cards in the deck'

  it 'lets play continue when there are valid sets in the spread'
end
