# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def initialize(name: 'Дилер')
    @name = name
    super()
  end
end
