# frozen_string_literal: true

class Interface
  def initialize
    ask_name
  end

  def ask_name
    puts 'Введите свое имя и нажмите Enter!'
    name = gets.chomp
    @user.name = name
    puts "Привет, #{name}. Игра началась!"
    puts '___________________'
  end

def show_users_score
  puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
  puts '___________________'
end

def show_dealers_score

end

    puts 'Карты дилера |*| |*|'
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
    puts @user.hand.cards.map(&:face)
    puts "Сумма твоих очков, #{@user.name}: #{@user.hand.score}"
    puts '___________________'
    puts @dealer.hand.cards.map(&:face)
    puts "Сумма очков дилера: #{@dealer.hand.score}"
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
      puts "#{@user.name} lose. Dealer wins!"
    else
      puts "Dealer lose. #{@user.name} wins!"
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
