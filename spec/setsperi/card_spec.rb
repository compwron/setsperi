require_relative 'spec_helper'

describe Card do
  let(:c1) { Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red) }
  let(:c2) { Card.new(Card::Number::Two, Card::Symbol::Squiggle, Card::Shading::Striped, Card::Color::Green) }

  describe 'self.resurrect' do
    it 'should create a card from a user input' do
      expect(Card.resurrect('1DSoR')).to eq c1
      expect(Card.resurrect('2SStG')).to eq c2
    end

    it 'creates no card from invalid input' do
      expect(Card.resurrect('foo')).to eq nil
    end
  end

  it 'is equal to a card with the same attributes' do
    expect(c1).to eq c1
  end

  it 'is not equal to a card with different attributes' do
    expect(c1).to_not eq c2
  end

  it 'prints legibly' do
    expect(c1.to_s).to eq '1 diamond:solid:red'
  end

  describe 'input_style' do
    it 'should shorten a card' do
      expect(c1.input_style).to eq '1DSoR'
      expect(c2.input_style).to eq '2SStG'
    end
  end
end
