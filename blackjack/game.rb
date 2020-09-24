# frozen_string_literal: true

class Game
  attr_reader :game_bank

  def initialize
    @game_bank = 0
  end

  def take_bet
    @game_bank += 20
  end
end
