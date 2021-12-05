require './lib/card'
require './lib/deck'
require './lib/turn'
require 'pry'
class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    return @deck.cards.first
  end

  # def method_name
  #
  # end


end
