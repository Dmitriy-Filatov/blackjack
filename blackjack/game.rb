# frozen_string_literal: true

require 'pry'

class Game
  attr_reader :game_bank

  def initialize
    @game_bank = 0
  end

  def take_bet
    @game_bank += 20
  end
end

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

class User < Player
  def initialize(name)
    @name = name
    super()
  end
end

class Dealer < Player
  def initialize(name: 'Дилер')
    @name = name
    super()
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take(cards)
    cards.each { |card| @cards << card }
  end

  def weight(card)
    return 11 if card.card_value == 'A'

    if ('2'..'10').include?(card.card_value)
      card.card_value.to_i
    else
      10
    end
  end

  def score
    @cards.sum do |card|
      weight(card)
    end
  end
end

class Card
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def card_value
    @symbol[0]
  end
end

class Deck
  DECK = %w[2♠ 3♠ 4♠ 5♠ 6♠ 7♠ 8♠ 9♠ 10♠ J♠ Q♠ K♠ A♠
            2♥ 3♥ 4♥ 5♥ 6♥ 7♥ 8♥ 9♥ 10♥ J♥ Q♥ K♥ A♥
            2♦ 3♦ 4♦ 5♦ 6♦ 7♦ 8♦ 9♦ 10♦ J♦ Q♦ K♦ A♦
            2♣ 3♣ 4♣ 5♣ 6♣ 7♣ 8♣ 9♣ 10♣ J♣ Q♣ K♣ A♣].freeze

  def initialize
    @deck = initialize_deck
  end

  def initialize_deck
    DECK.shuffle.map do |card_symbol|
      Card.new(card_symbol)
    end
  end

  def pop_card
    @deck.pop
  end

  def pop_two_cards
    [pop_card, pop_card]
  end
end

Interface.new.go
