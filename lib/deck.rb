require './lib/card'
require './lib/deck'
require './lib/turn'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

end
