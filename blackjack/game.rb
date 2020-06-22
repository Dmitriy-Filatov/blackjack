# frozen_string_literal: true

class Interface
end

class Game
  attr_reader :game_bank

  def initialize
    @interface = Interface.new
    @game_bank = 0
  end

  def take_bet
    @game_bank += 20
  end

  def go
    game = Game.new
    puts 'Введите имя'
    @user = User.new(name: gets.chomp)
    @diller = Diller.new
    deck = Deck.new
    @user.get_cards(deck.pop_two_cards)
    @diller.get_cards(deck.pop_two_cards)
    puts(@user.hand.cards.map(&:symbol))
    puts(@user.hand.score)
    puts '**'
    @user.make_bet
    @diller.make_bet
    game.take_bet
    party_loop
  end

  def party_loop
    loop do
      puts 'Введите: 1 - пропустить ход; 2 - добавить карту; 3 - открыть карты.'
      user_input = gets.chomp
      user_move(user_input)
      dillers_move deck:
      puts(@user.hand.score)
      break # if
    end
  end

  def user_move(user_input)
    case user_input
    when '1'
      nil
    when '2'
      get_one_card_from_the if @user.hand.cards.count == 2
    when '3'
      open_cards
    end
  end

  def get_one_card_from_the
  end

  def dillers_move(deck:)
    if @diller.hand.score >= 17
      nil
    else
      @diller.get_cards(deck.pop_card)
    end
  end

  def open_cards
    puts @diller.hand.cards.map(&:symbol)
    puts @user.hand.cards.map(&:symbol)
    puts @diller.hand.score
    results
  end

  def results
    diller_score = (21 - @diller.hand.score).abs
    user_score = (21 - @user.hand.score).abs
    if diller_score == user_score
      puts 'Dead heat!'
      return
    end
    if diller_score < user_score
      puts 'User lose. Diller wins!'
    else
      puts 'Diller lose. User wins!'
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
  attr_reader :player_bank, :hand

  def initialize
    @hand = Hand.new
    @player_bank = 100
  end

  def get_cards(cards)
    @hand.take_cards(cards)
  end

  def make_bet
    @player_bank -= 10
  end
end

class User < Player
  def initialize(name:)
    @name = name
    super()
  end
end

class Diller < Player
  def initialize(name: 'Diller')
    @name = name
    super()
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take_cards(cards)
    cards.each do |card|
      @cards << card
    end
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
