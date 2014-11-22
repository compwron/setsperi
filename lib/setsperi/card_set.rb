  require 'pry'
  class CardSet
    def initialize(cards)
      @validity = _valid? cards
    end

    def _valid?(cards)
      return false unless cards.size == 3
      return false if cards[0] == cards[1] && cards[1] == cards[2] # hack instead of .inject(&:==)
      return false if cards.map(&:number).uniq.size == 2
      return false if cards.map(&:symbol).uniq.size == 2
      return false if cards.map(&:shading).uniq.size == 2
      return false if cards.map(&:color).uniq.size == 2
      true
    end

    def valid?
      @validity
    end
  end
