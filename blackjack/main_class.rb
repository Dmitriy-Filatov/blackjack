# frozen_string_literal: true

require 'pry'
require_relative 'interface'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'
require_relative 'user'
require_relative 'game'

class Main
  def initialize
    Interface.new(Game.new)
  end
end

Main.new
