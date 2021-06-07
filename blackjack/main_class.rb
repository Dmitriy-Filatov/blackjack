# frozen_string_literal: true

require 'pry'
require_relative 'interface'
require_relative 'game'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

class Main
  def initialize(interface)
    @interface = interface
  end

  def ask_username
    @interface.username_input
  end

  def game_logic_loop
    loop do @game.new_round

    end
  end

end

# Цикл будет вертеть логику игры.
# И вызывать нужные методы интерфейса при необходимости
game = Game.new
interface = Interface.new(game)
main = Main.new(interface)
binding.pry
main.ask_username
#game.game_logic_loop
