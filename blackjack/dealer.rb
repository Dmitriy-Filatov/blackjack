# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def initialize(name: 'Dealer')
    @name = name
    super()
  end
end
