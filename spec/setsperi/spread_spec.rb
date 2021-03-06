require_relative 'spec_helper'

describe Spread do
  let(:deck) { Deck.new }
  let(:spread_from_deck) { Spread.new(nil, nil, deck) }
  let(:invalid_user_set) { [] }
  let(:valid_user_set) do
    [
      Card.new(1, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red),
      Card.new(1, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Green),
      Card.new(1, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Purple)
    ]
  end

  let(:non_set_cards) do
    [
      Card.new(1, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red),
      Card.new(2, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Green),
      Card.new(2, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Purple)
    ]
  end

  describe 'user_gets_point_from_spread' do
    specify 'no point from empty user set' do
      expect(spread_from_deck.user_gets_point_from_spread).to eq false
    end

    specify 'no point from invalid user set' do
      expect(Spread.new(nil, non_set_cards, deck).user_gets_point_from_spread).to eq false
    end

    specify 'point from valid user set' do
      # spread_from_deck.cards -= spread_from_deck.cards.sample 3
      spread_from_deck.cards += valid_user_set
      expect(Spread.new(spread_from_deck, valid_user_set, deck).user_gets_point_from_spread).to eq true
    end
  end

  describe 'pretty' do
    # put the setup in a let and then assert against specify?
    let(:pretty_spread) { spread_from_deck.pretty }

    specify 'shows the default spread in 4x3 rows wspecifyh a total of 12 valid cards' do
      expect(pretty_spread.split("\n").size).to eq 3
      pretty_spread.split("\n").map do|l|
        expect(l.split(' ').size).to eq 4
      end
    end

    def _cards_in_pretty_spread(pretty)
      pretty.split("\n").map do|l|
        l.split(' ').map do|c|
          Card.resurrect(c)
        end
      end.flatten
    end

    specify 'has unique cards' do
      input_style_cards = _cards_in_pretty_spread(pretty_spread).map(&:input_style)
      expect(input_style_cards.uniq.size).to eq spread_from_deck.cards.size
    end
  end

  specify 'should have cards when made wspecifyh just a deck' do
    expect(spread_from_deck.cards.size).to eq 12
    expect(Card::Number).to include spread_from_deck.cards.first.number
  end

  specify 'should have the same cards as the previous spread when made wspecifyh a spread, no user set, and a deck' do
    s = Spread.new(spread_from_deck, nil, deck)
    expect(s.cards).to eq spread_from_deck.cards
  end

  specify 'should have the same cards as the previous spread when made wspecifyh a spread, an invalid user set, and a deck' do
    s = Spread.new(spread_from_deck, invalid_user_set, deck)
    expect(s.cards).to eq spread_from_deck.cards
  end

  specify 'should have three new cards when made wspecifyh a spread, a valid user set, and a deck' do
    cs = CardSet.new(valid_user_set)
    expect(cs).to be_valid

    cards_wspecifyh_set = (spread_from_deck.cards[0..9] << valid_user_set).flatten # make sure that spread includes valid set
    spread_from_deck.cards = cards_wspecifyh_set
    s = Spread.new(spread_from_deck, valid_user_set, deck)

    expect(s.cards).to_not eq cards_wspecifyh_set
    expect(_overlap_size(s.cards, cards_wspecifyh_set)).to eq 10 # waspecify, why 10?
  end

  specify 'should contain valid set' do
    spread_from_deck.cards = valid_user_set
    expect(spread_from_deck.has_valid_set?).to eq true
  end

  specify 'should detect containing no valid sets' do
    spread_from_deck.cards = non_set_cards
    expect(spread_from_deck.has_valid_set?).to eq false
  end

  def _overlap_size(arr1, arr2)
    (arr1 & arr2).size
  end
end
