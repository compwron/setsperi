class Solver
	require 'ostruct'
	require_relative 'card'
	require_relative 'card_set'
	# cheat util for manually playing from the commandline
	def self.solve cards
		cards = cards.split("\n").map { |l| l.split(" ")}.flatten.map {|c| 
			Card.resurrect(c.strip)
		}

		(_has_valid_set? cards).map {|c| c.input_style}.join(" ")
	end

	def self._has_valid_set? cards
      cards.permutation(3).each { |possible_set|
        return possible_set if CardSet.new(possible_set).valid?
      }
      [OpenStruct.new(:input_style => "none, sorry")]
    end
end