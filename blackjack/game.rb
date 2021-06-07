# frozen_string_literal: true

require 'pry'

class Game
  arg = %i[game_bank user dealer deck]
  attr_reader(*arg)

  def initialize
    @game_bank = 0
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start_game
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

  def give_one_card_to_user
    @user.cards([@deck.pop_card])
  end

  def dealer_move
    @dealer.cards([@deck.pop_card]) if @dealer.hand.score < 17
  end

  def party_loop
    loop do
      print_menu
      menue_number = gets.chomp
      show_cards
      break if results

      user_move(menue_number)
      dealers_move
      puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
    end
  end
end
