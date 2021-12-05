require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end



  # def method_name
  #
  # end


end
