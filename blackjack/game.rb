# frozen_string_literal: true

class Game
  attr_reader :game_bank, :user, :dealer

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @game_bank = 0
  end

  def take_bet
    @game_bank += 20
  end
end
