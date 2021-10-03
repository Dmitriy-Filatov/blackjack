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
    max_score = @card_set.inject(0) do |sum, card|
      card_value = if %w[J Q K].include?(card.value)
        10
      elsif card.value == 'A'
        sum + 11
      else
        card.value.to_i
      end
      sum + card_value
    end
    min_score = @card_set.inject(0) do |sum, card|
      card_value = if %w[J Q K].include?(card.value)
        10
      elsif card.value == 'A'
        sum + 1
      else
        card.value.to_i
      end
      sum + card_value
    end
    return max_score if max_score <= 21 && max_score > min_score

    min_score
  end
end
