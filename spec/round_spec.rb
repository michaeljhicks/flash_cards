require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'
RSpec.describe Round do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it "exists" do
    expect(@round).to be_an_instance_of(Round)
  end

  it "has deck" do
    expect(@round.deck).to eq(@deck)
  end

  it "turns empty" do
    expect(@round.turns).to eq([])
  end

  it "current card" do
    expect(@round.current_card).to eq(@card_1)
  end

end

RSpec.describe 'new turn' do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Mars", @card_2)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @new_turn_1 = @round.take_turn("Juneau")


  end

  it "take turns" do
    # binding.pry
    expect(@new_turn_1.class).to eq(Turn)
  end

  it "correct guess" do
    expect(@new_turn_1.correct?).to eq(true)
  end

  it "#turns" do # #turns = testing the turns method
    expect(@round.turns).to eq([@new_turn_1])
  end

  it "#number correct" do
    expect(@round.number_correct).to eq(1)
  end

  it "#current card" do
    expect(@round.current_card).to eq(@card_2) #object ID ...e90 -->
  end

  it "#take turn" do
    new_turn_2 = @round.take_turn("Venus") #
    expect(@round.turns.count).to eq(2)
  end

  it "#turns last feedback" do
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.turns.last).to eq(new_turn_2)
  end



end
