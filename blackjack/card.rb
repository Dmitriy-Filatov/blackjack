# frozen_string_literal: true

class Card
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def card_value
    @symbol[0]
  end
end
