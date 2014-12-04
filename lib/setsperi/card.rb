  class Card
    attr_reader :number, :symbol, :shading, :color
    def initialize(number, symbol, shading, color)
      @number, @symbol, @shading, @color = number, symbol, shading, color
    end

    def ==(other)
      other.number == number && other.symbol == symbol && other.shading == shading && other.color == color
    end

    def to_s
      input_style
    end

    def input_style
      [number, symbol[0], shading[0..1], color[0]].map do |i|
        Number.include?(i) ? i : i.capitalize
      end.join
    end

    def self.resurrect(dessicated_card)
      n = Number.find { |n| n == dessicated_card[0].to_i }
      s = Symbol.constants.map { |s| eval("Symbol::#{s}") }.find { |s| s.capitalize[0] == dessicated_card[1] }
      sh = Shading.constants.map { |sh| eval("Shading::#{sh}") }.find { |sh| sh.capitalize[0..1] == dessicated_card[2..3] }
      c = Color.constants.map { |c| eval("Color::#{c}") }.find { |c| c.capitalize[0] == dessicated_card[4] }
      [n, s, sh, c].compact.size == 4 ? Card.new(n, s, sh, c) : nil
    end

    Number = [1, 2, 3]

    module Symbol
      Diamond = 'diamond'
      Squiggle = 'squiggle'
      Oval = 'oval'
    end

    module Shading
      Solid = 'solid'
      Striped = 'striped'
      Open = 'open'
    end

    module Color
      Red = 'red'
      Green = 'green'
      Purple = 'purple'
    end
  end
