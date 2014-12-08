class Game
  require_relative 'deck'
  require_relative 'spread'

  attr_reader :deck, :spread, :user_points
  MAX_TURNS = Deck.starting_size

  def initialize(args)
    @out = args[:stdout] || STDOUT
    @deck = Deck.new
    @spread = Spread.new nil, nil, deck
  end

  def play
    @user_points = 0
    @turns = 0
    while _continue_play @turns, @deck, @spread
      @turns += 1
      @out.puts "Turn: #{turns_played}\n Spread: \n#{@spread.pretty}\nYour guess: "
      user_input_cards = _interpret_command gets.chomp
      break if @done
      @spread.add_extra_cards if @cheat
      puts "about to process"
      _process_input user_input_cards
      @out.puts "#{turns_played} turns played, #{@user_points} correct sets"
    end
    'game over'
  end

  def turns_played
    @turns
  end

  def _continue_play(turns_played, deck, spread)
    return false if turns_played > MAX_TURNS
    deck.cards.size > 0 || (spread.cards.size > 0 && spread.has_valid_set?)
  end

  def _process_input(user_input_cards)
    @spread = Spread.new(@spread, user_input_cards, @deck)
    # binding.pry
    puts @spread.cards
    @user_points += 1 if @spread.user_gets_point_from_spread
  end

  def _interpret_command(input)
    @done = true if _end_game? input
    @cheat = true if _draw_more? input
    return if @done || @cheat
    _cards_from(input)
  end

  def _cards_from(_input)
    _input.split(',').map { |i| Card.resurrect i.chomp }.compact
  end

  def _end_game?(_input)
    _input.chomp.downcase == 'done'
  end

  def _draw_more?(_input)
  end
end
