# frozen_string_literal: true

# class Cards
#   attr_reader :symbol
#
#   SUITS = %w[].freeze
#   VALUES = %w[].freeze
#
#   def initialize(symbol)
#     @symbol = symbol
#   end
#
#   def card_value
#     @symbol[0]
#   end
# end


class Card
  attr_reader :suit, :value

  SUITS = %w[♣ ♦ ♥ ♠].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def show
    [@suit, @value]
  end
end
