# frozen_string_literal: true

require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'diller'
require_relative 'user'
require_relative 'game'

class Interface
  def create_user
    puts 'Введите свое имя и нажмите Enter!'
    name = gets.chomp
    @user = User.new(name)
    puts "Привет, #{name}. Игра началась!"
  end

  def go
    create_user
    @game = Game.new
    @dealer = Dealer.new
    @deck = Deck.new
    @user.cards(@deck.pop_two_cards)
    puts(@user.hand.cards.map(&:symbol))
    puts(@user.hand.score)
    @dealer.cards(@deck.pop_two_cards)
    puts '**'
    @user.make_bet
    @dealer.make_bet
    @game.take_bet
    @game.game_bank
    party_loop
  end

  def party_loop
    loop do
      puts 'Введите: 1 - пропустить ход; 2 - добавить карту; 3 - открыть карты.'
      user_input = gets.chomp
      break if open_cards

      user_move(user_input)
      dealers_move
      puts(@user.hand.score)
    end
  end

  def user_move(user_input)
    case user_input
    when '1'
      dealers_move
    when '2'
      one_card if @user.hand.cards.count == 2
      open_cards if @user.hand.cards.count == 3 && @dealer.hand.cards.count == 3
    when '3'
      open_cards
    end
  end

  def one_card
    @user.cards(@deck.pop_card)
  end

  def dealers_move
    if @dealer.hand.score >= 17
      user_move(user_input)
    else
      @dealer.cards(@deck.pop_card)
    end
  end

  def open_cards
    puts @user.hand.cards.map(&:symbol)
    puts "#{@user.name}: #{@user.hand.score}."
    puts @dealer.hand.cards.map(&:symbol)
    puts "Дилер: #{@dealer.hand.score}."
    results
  end

  def results
    dealer_score = (21 - @dealer.hand.score).abs
    user_score = (21 - @user.hand.score).abs
    if dealer_score == user_score
      puts 'Dead heat!'
      return
    end
    if dealer_score < user_score
      puts 'User lose. Dealer wins!'
    else
      puts 'Dealer lose. User wins!'
    end
  end

  def action_choise(user_input)
    case user_input
    when '1'

    when '2'
    end
    # play another round
    # quit
  end
end

Interface.new.go
