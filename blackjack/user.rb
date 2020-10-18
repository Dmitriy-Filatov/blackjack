# frozen_string_literal: true

require_relative 'player'

class User < Player
  attr_accessor :name

  def initialize
    super()
  end
end
