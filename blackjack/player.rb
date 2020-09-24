# frozen_string_literal: true


class Player
  attr_reader :player_bank, :hand, :name

  def initialize
    @hand = Hand.new
    @player_bank = 100
  end

  def cards(cards)
    @hand.take(cards)
  end

  def make_bet
    @player_bank -= 10
  end
end
