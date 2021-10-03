# frozen_string_literal: true

require_relative 'interface'
require_relative 'game'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

interface = Interface.new
interface.greeting
interface.start_game
