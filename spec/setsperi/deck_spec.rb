require_relative 'spec_helper'

describe Deck do
  let(:new_deck) { Deck.new }

  it 'new deck has 81 cards' do
    expect(new_deck.cards.size).to eq 81
  end

  it 'each card has number, symbol, shading, color' do
    card = new_deck.cards.sample
    expect(Card::Number).to include card.number
    expect(Card::Symbol.constants).to include card.symbol
    expect(Card::Shading.constants).to include card.shading
    expect(Card::Color.constants).to include card.color
  end

  it 'accepts used cards and returns deck minus the used cards' do
    cards = new_deck.cards.sample 3
    new_deck.used(cards)
    expect(new_deck.cards.size).to eq(81 - 3)
  end

  it 'returns cards from the deck and marks those three cards as used' do
    c = new_deck.draw_cards 3
    expect(c.size).to eq 3
    expect(new_deck.cards.size).to eq (81 - 3)
  end
end
