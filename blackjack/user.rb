# frozen_string_literal: true

require_relative 'player'

class User < Player
  attr_accessor :name

  def initialize(name)
    @name = name
    super()
  end
end
