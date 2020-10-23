# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take(cards)
    cards.each { |card| @cards << card }
  end

  def weight(card)
    return 11 if card.value == 'A'

    if ('2'..'10').include?(card.value)
      card.value.to_i
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
