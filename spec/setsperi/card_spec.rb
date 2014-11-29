require_relative 'spec_helper'

describe Card do

  it 'is equal to a card with the same attributes' do
    c1 = Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
    c2 = Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
    expect(c1).to eq c2
  end

  it 'is not equal to a card with different attributes' do
    c1 = Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
    c2 = Card.new(Card::Number::Two, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
    expect(c1).to_not eq c2
  end

  it 'prints legibly' do
    c1 = Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
    expect(c1.to_s).to eq '1 diamond:solid:red'
  end

  describe 'input_style' do
    it 'should shorten a card' do
      c1 = Card.new(Card::Number::One, Card::Symbol::Diamond, Card::Shading::Solid, Card::Color::Red)
      expect(c1.input_style).to eq "1DSoR"

      c2 = Card.new(Card::Number::Two, Card::Symbol::Squiggle, Card::Shading::Striped, Card::Color::Green)
      expect(c2.input_style).to eq "2SStG"
    end
  end
end
