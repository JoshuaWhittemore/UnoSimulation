# frozen_string_literal: true

require "test_helper"

# class TestUnoSimulation < Minitest::Test
#   def test_that_it_has_a_version_number
#     refute_nil ::UnoSimulation::VERSION
#   end

#   def test_it_does_something_useful
#     assert false
#   end
# end

# require_relative "../lib/uno"

class UnoDeckTest < Minitest::Test
  def test_simple
    deck = UnoSimulation::Deck.new
    deck.shuffle
    top_card = deck.draw_positive_numbered
    covers_count = 0

    while deck.any?
      draw_card = deck.draw

      covers_count += 1 if draw_card.match?(top_card)
    end

    puts "simple test running"
    assert_equal 36, covers_count
  end
end

describe "thing" do
  it "puts the lotion in the bucket" do
    _(1).must_equal 1.0
  end
end

# describe  do
#   before do
#     @meme = Meme.new
#   end

#   describe "when asked about cheeseburgers" do
#     it "must respond positively" do
#       _(@meme.i_can_has_cheezburger?).must_equal "OHAI!"
#     end
#   end

#   describe "when asked about blending possibilities" do
#     it "won't say no" do
#       _(@meme.will_it_blend?).wont_match /^no/i
#     end
#   end
# end
