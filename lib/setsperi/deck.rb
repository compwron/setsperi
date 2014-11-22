class Deck
  require_relative 'card'
  attr_reader :cards

  def initialize
    @cards = _cards
    @used_cards = []
  end

  def used(cards)
    @used_cards << cards
    _remove_from_available_cards cards
 end

  def _remove_from_available_cards(cards)
    @cards = @cards - cards
  end

  def draw_cards(num)
    cards = @cards.sample num
    _remove_from_available_cards cards
    @used_cards << cards
    cards
  end

  def _cards
    Card::Number.constants.map do|n|
      Card::Symbol.constants.map do|sy|
        Card::Shading.constants.map do|sh|
          Card::Color.constants.map do|c|
            Card.new(n, sy, sh, c)
          end
        end
      end
    end.flatten
  end
end
