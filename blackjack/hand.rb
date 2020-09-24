# frozen_string_literal: true

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
