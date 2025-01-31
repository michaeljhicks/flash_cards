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

  def take_turn(guess)
    @turns.push Turn.new(guess, current_card)
    @deck.cards.rotate! #bang required because next time turn is taken, deck is reset to it's original state
    @turns.last #we're looking for the method to return on line 52 spec
  end

  def number_correct
    correct_turns =[]
    @turns.each do |turn|
      if turn.correct?
        correct_turns << turn
      end
    end
    correct_turns.length # Review
  end

  def number_correct_by_category(category)
    correct_turns = []
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        correct_turns << turn
      end
    end
    correct_turns.length
  end

  def percent_correct
    return number_correct.to_f / @turns.length.to_f * 100 #.to_f --> leading characters in a str as a floating point
  end

  def percent_correct_by_category(category)
    category_count = @turns.count do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).to_f / category_count.to_f * 100).round #.to_f --> leading characters in a str as a floating point
  end
end
