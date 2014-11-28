class Game
  require_relative 'deck'
  require_relative 'spread'

  attr_reader :deck, :spread
  MAX_TURNS = 2

  def initialize
    @deck = Deck.new
    @spread = Spread.new nil, nil, deck
  end

  def play
    @turns = 0
    while _continue_play @turns, @deck, @spread
      @turns += 1
      puts "turns: #{@turns}"
      user_input_cards = _interpret_command gets.chomp
      break if @done
      @spread.add_extra_cards if @cheat
      _process_input user_input_cards
    end
    "game over"
  end

  def turns_played
    @turns
  end

  def _continue_play turns_played, deck, spread
    return false if turns_played > MAX_TURNS
    deck.cards.size > 0 || (spread.cards.size > 0 && spread.has_valid_set?)
  end

  def _process_input(user_input_cards)
    @spread = Spread.new(@spread, user_input_cards, @deck)
  end

  def _interpret_command(input)
    @done = true if _end_game? input
    @cheat = true if _draw_more? input
    return if @done || @cheat
    CardSet.new _cards_from(input)
  end

  def _cards_from(_input)
    # validate format
    # make new object userCardSetValidator to do this?
    []
  end

  def _end_game?(_input)
    puts "input is: #{_input}"
    _input.chomp.downcase == "done"
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
