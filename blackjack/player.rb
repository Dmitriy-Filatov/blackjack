# frozen_string_literal: true

class Player
  attr_accessor :bank, :hand, :name

  def initialize
    @bank = 100
    @hand = Hand.new
  end

  def cards(cards)
    @hand.take(cards)
  end

  def make_bet
    @player_bank -= 10
  end
end
