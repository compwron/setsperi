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

    def input_style
      [number, symbol[0], shading[0..1], color[0]].map {|i| i == i.to_i ? i : i.capitalize}.join
      # "#{number[0]}#{symbol[0]}#{shading[0..1]}#{color[0]}" # a code that can be output and input
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
