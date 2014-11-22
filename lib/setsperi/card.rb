  class Card
    attr_reader :number, :symbol, :shading, :color
    def initialize(number, symbol, shading, color)
      @number, @symbol, @shading, @color = number, symbol, shading, color
    end

    def ==(other)
      other.number == number && other.symbol == symbol && other.shading == shading && other.color == color
    end

    def to_s
      "#{number} #{symbol}:#{shading}:#{color}" # .colorize(color.to_sym)
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
