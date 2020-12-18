# frozen_string_literal: true

class Game
  arg = %i[game_bank user dealer deck]
  attr_reader(*arg)

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @game_bank = 0
  end

  def new_round
    give_2_cards_to_user
    give_2_cards_to_dealer
    user_make_bet
    dealer_make_bet
    game_bank_take_bet
  end

  def give_2_cards_to_user
    @user.cards(@deck.pop_two_cards)
  end

  def give_2_cards_to_dealer
    @dealer.cards(@deck.pop_two_cards)
  end

  def user_make_bet
    @user.make_bet
  end

  def dealer_make_bet
    @dealer.make_bet
  end

  def game_bank_take_bet
    @game_bank += 20
  end
end
