class Game
  require_relative 'deck'
  require_relative 'spread'
  def initialize
    @deck = Deck.new
    @used_cards = []
  end

  def play
    while _continue_play
      # user_set = get from user
      # spread = spread.evaluate(user_set)
      # show spread to user

      # puts "Spread is: #{_spread}"
      # user_set = gets.strip!.split
    end
    # return stats of play (sets found, fastest time-to-set)
  end

  def _continue_play
    @deck.size > 0 && _sets_in_spread?(@current_cards)
  end

  def _sets_in_spread?(_current_cards)
    true
  end

  def _spread
    Spread.new nil, [], Deck.new
  end
end
