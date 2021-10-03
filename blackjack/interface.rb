# frozen_string_literal: true

class Interface
  attr_accessor :game

  def initialize
    @game = Game.new(self)
  end

  def greeting
    user_input_message
    username_input
    user_greeting
    line
  end

def ask_user_to_play_one_more_time
  puts 'Введите 1 если хотите продолжть.'
end

  def user_input_message
    puts 'Введите свое имя и нажмите Enter!'
  end

  def username_input
    game.user.name = gets.chomp
  end

  def user_greeting
    puts "Привет, #{game.user.name.upcase}! Игра началась!"
  end

  def line
    puts '___________________'
  end

  def user_input
    gets.chomp
  end

  def start_game
    game.start_game
  end

  def user_cards
    puts game.user.hand.card_set.map(&:face)
  end

  def dealers_invisible_cards
    puts 'Карты дилера |*| |*|'
  end

  def dealer_cards
    puts game.dealer.hand.card_set.map(&:face)
  end

  def show_cards
    user_cards
    puts '_________'
    dealers_invisible_cards
  end

  def user_score
    puts "Сумма твоих очков, #{game.user.name}: #{game.user.hand.score}"
  end

  def dealer_score
    puts "Сумма очков дилера: #{game.dealer.hand.score}"
  end

  def menu
    puts 'Введите: 1 - пропустить ход; 2 - добавить карту; 3 - открыть карты.'
  end

  def players_cards_and_score
    line
    user_cards
    user_score
    line
    dealer_cards
    dealer_score
    line
    puts "Твой банк: #{game.user.bank}"
    puts "Банк дилера: #{game.dealer.bank}"
  end

  def dead_heat_message
    puts 'Dead heat!'
  end

  def user_winning_message
    puts "#{game.user.name} wins!"
  end

  def dealer_winning_message
    puts 'Dealer wins!'
  end
end
