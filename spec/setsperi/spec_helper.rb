require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'simplecov'
SimpleCov.start

require 'ostruct'
require_relative '../../lib/setsperi/card.rb'
require_relative '../../lib/setsperi/card_set.rb'
require_relative '../../lib/setsperi/deck.rb'
require_relative '../../lib/setsperi/game.rb'
