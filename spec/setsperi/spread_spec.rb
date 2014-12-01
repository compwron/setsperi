require_relative 'spec_helper'

describe Spread do
  let(:deck) { Deck.new }
  let(:spread_from_deck) { Spread.new(nil, nil, deck) }
  let(:invalid_user_set) { [] }
  let(:valid_user_set) do
    [
      Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red),
      Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Green),
      Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Purple)
    ]
  end

  let(:non_set_cards) do
    [
      Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red),
      Card.new(Card::Number::Two, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Green),
      Card.new(Card::Number::Two, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Purple)
    ]
  end

  it 'should have cards when made with just a deck' do
    expect(spread_from_deck.cards.size).to eq 12
    expect([:One, :Two, :Three]).to include spread_from_deck.cards.first.number
  end

  it 'should have the same cards as the previous spread when made with a spread, no user set, and a deck' do
    s = Spread.new(spread_from_deck, nil, deck)
    expect(s.cards).to eq spread_from_deck.cards
  end

  it 'should have the same cards as the previous spread when made with a spread, an invalid user set, and a deck' do
    s = Spread.new(spread_from_deck, invalid_user_set, deck)
    expect(s.cards).to eq spread_from_deck.cards
  end

  it 'should have three new cards when made with a spread, a valid user set, and a deck' do
    cs = CardSet.new(valid_user_set)
    expect(cs).to be_valid

    cards_with_set = (spread_from_deck.cards[0..9] << valid_user_set).flatten # make sure that spread includes valid set
    spread_from_deck.cards = cards_with_set
    s = Spread.new(spread_from_deck, valid_user_set, deck)

    expect(s.cards).to_not eq cards_with_set
    expect(_overlap_size(s.cards, cards_with_set)).to eq 10 # wait, why 10?
  end

  it 'should contain valid set' do
    spread_from_deck.cards = valid_user_set
    expect(spread_from_deck.has_valid_set?).to eq true
  end

  it 'should detect containing no valid sets' do
    spread_from_deck.cards = non_set_cards
    expect(spread_from_deck.has_valid_set?).to eq false
  end

  def _overlap_size(arr1, arr2)
    (arr1 & arr2).size
  end
end
