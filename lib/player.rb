# frozen_string_literal: true

class Player
  def initialize(hp:, name:)
    @hp = hp
    @name = name
  end

  attr_accessor :hp
  attr_reader :name
end
