  require 'pry'
  class CardSet
    def initialize(cards)
      @validity = _valid? cards
    end

    def _valid?(cards)
      return false unless cards.size == 3
      return false if cards[0] == cards[1] && cards[1] == cards[2] # hack instead of .inject(&:==)
      [:number, :symbol, :shading, :color].each do|attribute|
        return false if cards.map(&attribute).uniq.size == 2
      end
      true
    end

    def valid?
      @validity
    end
  end
