require_relative 'spec_helper'

describe CardSet do
  specify 'sees no set in zero cards' do
    expect(CardSet.new []).to_not be_valid
  end

  describe 'invalid' do
    specify 'sees no set in cards with two squiggles' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'purple')
      ])
      expect(s.valid?).to eq false
    end

    specify 'sees no set in cards with two of the same color' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red'),
        Card.new(1, 'oval', 'solid', 'purple')
      ])
      expect(s.valid?).to eq false
    end

    specify 'sees no set in cards with two of the same shading' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red'),
        Card.new(1, 'oval', 'open', 'red')
      ])
      expect(s.valid?).to eq false
    end

    specify 'invalid set with all identical cards' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'diamond', 'solid', 'red')
      ])
      expect(s.valid?).to eq false
    end

    specify 'sees no set in cards which have a set but also an extra card' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red'),
        Card.new(1, 'oval', 'solid', 'red'),
        Card.new(1, 'oval', 'solid', 'purple')
      ])
      expect(s.valid?).to eq false
    end

    specify 'sees no set in cards which are too few to make a set' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red')
      ])
      expect(s.valid?).to eq false
    end
  end

  describe 'valid' do
    specify 'shape-different valid set' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'red'),
        Card.new(1, 'oval', 'solid', 'red')
      ])
      expect(s.valid?).to eq true
    end

    specify 'color, shape -different valid set' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(1, 'squiggle', 'solid', 'green'),
        Card.new(1, 'oval', 'solid', 'purple')
      ])
      expect(s.valid?).to eq true
    end

    specify 'number, color, shape -different valid set' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(2, 'squiggle', 'solid', 'green'),
        Card.new(3, 'oval', 'solid', 'purple')
      ])
      expect(s.valid?).to eq true
    end

    specify 'number, color, shape, shading -different valid set' do
      s = CardSet.new([
        Card.new(1, 'diamond', 'solid', 'red'),
        Card.new(2, 'squiggle', 'striped', 'green'),
        Card.new(3, 'oval', 'open', 'purple')
      ])
      expect(s.valid?).to eq true
    end

  end
end
