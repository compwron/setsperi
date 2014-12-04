require_relative 'spec_helper'

describe Game do
  let(:assigned_out) {StringIO.new}
  let(:g) { Game.new(stdout: assigned_out) }
  let (:empty_deck) { deck = g.deck; deck.cards = []; deck }
  let (:empty_spread) { spread = g.spread; spread.cards = []; spread }
  let (:valid_set) do
    [Card.new(1, 'diamond', 'solid', 'red'),
     Card.new(1, 'squiggle', 'solid', 'red'),
     Card.new(1, 'oval', 'solid', 'red')]
  end
  let (:valid_input_set) { valid_set.map(&:input_style).join(',') }
  let(:card) { Card.new(1, 'squiggle', 'solid', 'red') }

  describe '_cards_from' do
    it 'understands there are no cards in an invalid submitted set' do
      expect(g._cards_from('foo')). to eq []
    end

    it 'understands there are no cards in an empty submitted set' do
      expect(g._cards_from('')).to eq []
    end

    it 'sees one card in a set' do
      expect(g._cards_from(card.input_style)).to eq [card]
    end

    it 'sees several cards in a set' do
      expect(g._cards_from(valid_input_set)).to eq valid_set
    end
  end

  describe 'play' do

    it 'ends when there are no valid sets left' do
      g.deck.cards = []
      g.spread.cards = []
      expect(g.play).to eq 'game over'
      expect(g.turns_played).to eq 0
      g.play
      binding.pry
      puts "assigned out: #{assigned_out}"
       # }.to output('my message').to_stdout
    end

    it 'ends when user says done' do
      expect(g).to receive(:gets).and_return('done')
      g.play
      expect(g.turns_played).to eq 1
    end

    it 'removes cards from deck when user finds valid set' do
      # stock a spread with a valid set
      # user submits the valid set
      # user gets a point
      # turn advances
      g.spread.cards -= g.spread.cards.sample 3
      g.spread.cards += valid_set

      # Play valid set and then end game so we can count the points
      expect(g).to receive(:gets).and_return(valid_input_set, 'done')
      g.play
      expect(g.turns_played).to eq 2
    end

    describe 'summary' do
      #
    end
  end

  it 'starts with full deck minus spread' do
    expect(g.deck.cards.size).to eq(81 - 12)
    expect(g.spread.cards.size).to eq 12
  end

  it 'stops play when there are no more cards in the deck and no valid sets in the spread' do
    expect(g._continue_play 0, empty_deck, empty_spread).to eq false
  end

  it 'continues play when there are cards in the deck' do
    g.spread.cards = []
    expect(g._continue_play 0, g.deck, empty_spread).to eq true
  end

  it 'continues play when there are valid sets in the spread' do
    expect(g._continue_play 0, empty_deck, g.spread).to eq true
  end
end
