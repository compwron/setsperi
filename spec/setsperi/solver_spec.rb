require_relative 'spec_helper'

describe Game do
  let(:cards) { "2SSoP 1OOpG 2DStR 1SOpP 3SOpP 3OOpR 3SStP 3DStP\n2SSoG 1OStP 2SOpG 1SStP" }

  describe 'self.solve' do
    it 'presents a set that Spread agrees with' do
      set_cards = Solver.solve(cards)
      expect(set_cards).to eq '2SSoP 1SOpP 3SStP'
      # expect(Spread.new(nil, set_cards, Deck.new).user_gets_point_from_spread).to eq true
    end
  end
end
