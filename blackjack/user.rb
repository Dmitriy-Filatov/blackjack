# frozen_string_literal: true

require_relative 'player'

class User < Player
  attr_reader :name

  def initialize
    super()
  end
end
