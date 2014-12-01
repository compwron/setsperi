  class Card
    attr_reader :number, :symbol, :shading, :color
    def initialize(number, symbol, shading, color)
      @number, @symbol, @shading, @color = number, symbol, shading, color
    end

    def ==(other)
      other.number == number && other.symbol == symbol && other.shading == shading && other.color == color
    end

    def to_s
      "#{number} #{symbol}:#{shading}:#{color}"
    end

    def input_style
      [number, symbol[0], shading[0..1], color[0]].map { |i| i == i.to_i ? i : i.capitalize }.join
    end

    def self.resurrect(dessicated_card)
      n = Number.constants.map { |n| eval("Number::#{n}") }.find { |n| n == dessicated_card[0].to_i }
      s = Symbol.constants.map { |s| eval("Symbol::#{s}") }.find { |s| s.capitalize[0] == dessicated_card[1] }
      sh = Shading.constants.map { |sh| eval("Shading::#{sh}") }.find { |sh| sh.capitalize[0..1] == dessicated_card[2..3] }
      c = Color.constants.map { |c| eval("Color::#{c}") }.find { |c| c.capitalize[0] == dessicated_card[4] }
      [n, s, sh, c].compact.size == 4 ? Card.new(n, s, sh, c) : nil
    end

    module Number
      One = 1
      Two = 2
      Three = 3
    end

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
