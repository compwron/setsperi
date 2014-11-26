class Game
  require_relative 'deck'
  require_relative 'spread'

  attr_reader :deck, :spread

  def initialize
    @deck = Deck.new
    @spread = Spread.new nil, nil, deck
  end

  def play
    while _continue_play
      user_input_cards = _interpret_command gets.chomp
      break if @done
      @spread.add_extra_cards if @cheat
      _process_input user_input_cards
    end
  end

  def _continue_play
    @deck.cards.size > 0 || (@spread.cards.size > 0 && @spread.has_valid_set?)
  end

  def _process_input(user_input_cards)
    @spread = Spread.new(@spread, user_input_cards, @deck)
  end

  def _interpret_command(input)
    @done = true && return if _end_game? input
    @cheat = true && return if _draw_more? input

    CardSet.new _cards_from(input)
  end

  def _cards_from(_input)
    # validate format
    # make new object userCardSetValidator to do this?
    []
  end

  def _end_game?(_input)
  end

  def _draw_more?(_input)
  end
end

# def play
#   puts "#{current_player.name} has randomly been selected as the first player"
#   while true
#     board.formatted_grid
#     puts ""
#     puts solicit_move
#     x, y = get_move
#     board.set_cell(x, y, current_player.color)
#     if board.game_over
#       puts game_over_message
#       board.formatted_grid
#       return
#     else
#       switch_players
#     end
#   end
# end
