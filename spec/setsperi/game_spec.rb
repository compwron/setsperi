require_relative 'spec_helper'

describe Game do
  let(:g) { Game.new }
  let (:empty_deck) { deck = Game.new.deck ; deck.cards = [] ; deck}
  let (:empty_spread) { spread = Game.new.spread ; spread.cards = [] ; spread}

  describe 'play' do
    it 'ends when there are no valid sets left' do
      g.deck.cards = []
      g.spread.cards = []
      expect(g.play).to eq "game over"
      expect(g.turns_played).to eq 0
    end

    it 'ends when user says done' do
      expect(g).to receive(:gets).and_return("done")
      g.play
      expect(g.turns_played).to eq 1
    end
  end

  it 'starts with full deck minus spread' do
    expect(g.deck.cards.size).to eq(81 - 12)
    expect(g.spread.cards.size).to eq 12
  end

  it 'stops play when there are no more cards in the deck and no valid sets in the spread' do
    puts "empty deck is: #{empty_deck}"
    expect(g._continue_play 0, empty_deck, empty_spread).to eq false
  end

  it 'continues play when there are cards in the deck' do
    g.spread.cards = []
    expect(g._continue_play 0, g.deck, empty_spread).to eq true
  end

  it 'continues play when there are valid sets in the spread' do
    expect(g._continue_play 0, empty_deck, g.spread).to eq true
  end



  it 'lets play continue when there are cards in the deck'

  it 'lets play continue when there are valid sets in the spread'
end


