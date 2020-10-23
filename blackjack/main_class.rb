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
    game = Game.new
    # Класс интерфейса получает класс игры и теперь управляет ей:
    # 1) Получая состояние/статус игры (вывод информации)
    # 2) Возможные варианты действий - меню (ввод информации)
    interface = Interface.new(game)
    interface.go
  end
end

Main.new
