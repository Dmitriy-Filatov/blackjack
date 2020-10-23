# frozen_string_literal: true

require_relative 'card'

class Deck
  def initialize
    @deck = initialize_deck
  end

  def pop_card
    @deck.pop
  end

  def pop_two_cards
    [pop_card, pop_card]
  end

  private

  def initialize_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::RANKS.each { |value| deck << Card.new(value, suit) }
    end
    deck.shuffle
  end
end
