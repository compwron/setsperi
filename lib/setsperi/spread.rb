  class Spread
    attr_accessor :cards
    def initialize(spread, user_set, deck)
      @cards = if spread.nil?
         _cards deck
      elsif _user_set_in_spread?(spread, user_set) && _valid_set?(user_set)
        spread.cards - user_set + deck.draw_cards(3)
      else
        spread.cards
      end
    end

    def _user_set_in_spread?(spread, user_set)
      return false if spread.nil?
      return false if user_set.nil?
      (spread.cards & user_set).size == 3
    end

    def _valid_set? user_set
      CardSet.new(user_set).valid?
    end

    def _cards(deck)
      deck.draw_cards 12
    end
  end
