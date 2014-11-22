require_relative 'spec_helper'

describe Card do
  xit 'has all types of cards' do
    # expect(Card::Number.constants).to eq [:One, :Two, :Three]
  end

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
end
