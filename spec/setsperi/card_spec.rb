require_relative 'spec_helper'

describe Setsperi::Card do
  xit 'has all types of cards' do
    # expect(Setsperi::Card::Number.constants).to eq [:One, :Two, :Three]
  end

  it 'is equal to a card with the same attributes' do
    c1 = Setsperi::Card.new(Setsperi::Card::Number::One, Setsperi::Card::Symbol::Diamond, Setsperi::Card::Shading::Solid, Setsperi::Card::Color::Red)
    c2 = Setsperi::Card.new(Setsperi::Card::Number::One, Setsperi::Card::Symbol::Diamond, Setsperi::Card::Shading::Solid, Setsperi::Card::Color::Red)
    expect(c1).to eq c2
  end

  it 'is not equal to a card with different attributes' do
    c1 = Setsperi::Card.new(Setsperi::Card::Number::One, Setsperi::Card::Symbol::Diamond, Setsperi::Card::Shading::Solid, Setsperi::Card::Color::Red)
    c2 = Setsperi::Card.new(Setsperi::Card::Number::Two, Setsperi::Card::Symbol::Diamond, Setsperi::Card::Shading::Solid, Setsperi::Card::Color::Red)
    expect(c1).to_not eq c2
  end

  it 'prints legibly' do
    c1 = Setsperi::Card.new(Setsperi::Card::Number::One, Setsperi::Card::Symbol::Diamond, Setsperi::Card::Shading::Solid, Setsperi::Card::Color::Red)
    expect(c1.to_s).to eq '1 diamond:solid:red'
  end
end
