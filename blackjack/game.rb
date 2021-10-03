# frozen_string_literal: true

class Game
  arg = %i[interface game_bank user dealer deck]
  attr_reader(*arg)
  attr_writer(*arg)

  def initialize(interface)
    @interface = interface
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
    party_loop
    interface.players_cards_and_score
    results
    if user_want_to_play_one_more_time
      user.refresh_hand
      dealer.refresh_hand
      start_game
    end
  end

  def user_want_to_play_one_more_time
    interface.ask_user_to_play_one_more_time
    res = interface.user_input
    res == '1'
  end

  def give_2_cards_to_user
    user.cards(deck.pop_two_cards)
  end

  def give_2_cards_to_dealer
    dealer.cards(deck.pop_two_cards)
  end

  def user_make_bet
    user.make_bet
  end

  def dealer_make_bet
    dealer.make_bet
  end

  def game_bank_take_bet
    self.game_bank += 20
  end

  def give_one_card_to_user
    @user.cards([@deck.pop_card])
  end

  def dealer_move
    @dealer.cards([@deck.pop_card]) if @dealer.hand.score < 17
  end

  def players_actions(menue_number)
    case menue_number
    when '1'
      dealer_move
      { game_over: user_and_dealer_have_3_cards }
    when '2'
      give_one_card_to_user if @user.hand.card_set.count == 2
      { game_over: user_and_dealer_have_3_cards }
    when '3'
      { game_over: true }
    end
  end

  def user_and_dealer_have_3_cards
    @user.hand.card_set.count == 3 && @dealer.hand.card_set.count == 3
  end

  def results
    dealer_score = dealer.hand.score
    user_score = user.hand.score
    if (dealer_score == user_score) || (dealer_score > 21 && user_score > 21)
      interface.dead_heat_message
      return
    end
    if (dealer_score < user_score && user_score <= 21) || (user_score <= 21 && dealer_score > 21)
      interface.user_winning_message
    else
      interface.dealer_winning_message if dealer_score <= 21
    end
  end

  def party_loop
    loop do
      interface.show_cards
      interface.menu
      menue_number = interface.user_input
      res = players_actions(menue_number)
      if res[:game_over]
        break
      end
    end
  end
end
