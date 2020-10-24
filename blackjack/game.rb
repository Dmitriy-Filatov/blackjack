# frozen_string_literal: true

class Game
  arg = %i[game_bank user dealer]
  attr_reader(*arg)

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @game_bank = 0
  end

  def take_bet
    @game_bank += 20
  end
end
