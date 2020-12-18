# frozen_string_literal: true

class Interface
  def initialize(argument)
    @argument = argument
  end

  def ask_name
    user_input_message
    username_input
    user_greeting
    line
  end

  def user_input_message
    puts 'Введите свое имя и нажмите Enter!'
  end

  def username_input
    @name = gets.chomp
  end

  def user_greeting
    puts "Привет, #{@name}. Игра началась!"
  end

  def line
    puts '___________________'
  end

  def user_cards
    puts @user.hand.cards.map(&:face)
  end

  def dealers_invisible_cards
    puts 'Карты дилера |*| |*|'
  end

  def dealer_cards
    puts @dealer.hand.cards.map(&:face)
  end

  def user_score
    puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
  end

  def dealer_score
    puts "Сумма очков дилера: #{@dealer.hand.score}"
  end

  def menu
    puts 'Введите: 1 - пропустить ход; 2 - добавить карту; 3 - открыть карты.'
  end

  def prayers_cards_and_score
    line
    user_cards
    user_score
    line
    dealer_cards
    dealer_score
    line
  end

  def results
    players_score
    if @dealer_score == @user_score
      dead_heat_message
      return
    end
    if @dealer_score < @user_score
      user_winning_message
    else
      dealer_winning_message
    end
  end

  def players_score
    @dealer_score = (21 - @dealer.hand.score).abs
    @user_score = (21 - @user.hand.score).abs
  end

  def dead_heat_message
    puts 'Dead heat!'
  end

  def user_winning_message
    puts "#{@user.name} wins!"
  end

  def dealer_winning_message
    puts 'Dealer wins!'
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

  def action_choise(user_input)
    case user_input
    when '1'

    when '2'
    end
    # play another round
    # quit
  end
end
