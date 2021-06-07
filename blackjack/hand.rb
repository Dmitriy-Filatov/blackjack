# frozen_string_literal: true

require_relative 'card'

class Hand
  attr_reader :card_set

  def initialize
    @card_set = []
  end

  def take(cards)
    cards.each { |card| @card_set << card }
  end

  def score
    @card_set.inject(0) do |sum, card|
      card_value = if %w[J Q K].include?(card.value)
        10
      elsif card.value == 'A'
        sum + 11 > 21 ? 1 : 11
      else
        card.value.to_i
      end
      sum + card_value
    end
  end
end
