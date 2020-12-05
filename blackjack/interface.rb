# frozen_string_literal: true

class Interface
  def initialize(game)
    @game = game
    @user = game.user
    @dealer = game.dealer
  end

  def go
    ask_name #if @user.name.lenght == 0 ili
    @deck = Deck.new
    @user.cards(@deck.pop_two_cards)
    puts(@user.hand.cards.map(&:show))
    puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
    puts '___________________'
    @dealer.cards(@deck.pop_two_cards)
    puts 'Карты дилера |*| |*|'
    puts '___________________'
    @user.make_bet
    @dealer.make_bet
    @game.take_bet
    @game.game_bank
    party_loop
  end

  def ask_name
    puts 'Введите свое имя и нажмите Enter!'
    name = gets.chomp
    @user.name = name
    puts "Привет, #{name}. Игра началась!"
    puts '___________________'
  end

  def print_menu
    puts 'Введите: 1 - пропустить ход; 2 - добавить карту; 3 - открыть карты.'
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

  def user_move(menue_number)
    case menue_number
    when '1'
      dealers_move
    when '2'
      one_card if @user.hand.cards.count == 2
      show_cards if @user.hand.cards.count == 3 && @dealer.hand.cards.count == 3
    when '3'
      show_cards
    end
  end

  def one_card
    @user.cards([@deck.pop_card])
  end

  def dealers_move
    @dealer.cards([@deck.pop_card]) if @dealer.hand.score < 17
  end

  def show_cards
    puts '___________________'
    puts @user.hand.cards.map(&:show)
    puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
    puts '___________________'
    puts @dealer.hand.cards.map(&:show)
    puts "Сумма очков Дилера: #{@dealer.hand.score}"
    puts '___________________'
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
