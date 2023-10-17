# frozen_string_literal: true

require "test_helper"

class UnoDeckTest < Minitest::Test
  def test_draw_positive_numbered
    deck = UnoSimulation::Deck.new
    deck.shuffle!

    card = deck.draw_positive_numbered
    assert (1..9).cover?(card.number_or_symbol)
    assert UnoSimulation::Card::VALID_COLORS.member?(card.color)

    # Draw another, just to be sure.
    card = deck.draw_positive_numbered
    assert (1..9).cover?(card.number_or_symbol)
    assert UnoSimulation::Card::VALID_COLORS.member?(card.color)
  end

  def test_check_deck
    deck = UnoSimulation::Deck.new
    assert_equal 112, deck.cards.size

    deck.shuffle!
    top_card = deck.draw_positive_numbered
    assert_equal 111, deck.cards.size

    # Exactly 42 cards remaining in the deck should match this card.
    #   18 numbered cards of same color.
    #   6 action cards of same color (reverse, draw 2, skip).
    #   6 cards of same number but different color.
    #   12 wild cards.
    assert_equal 42, deck.cards.count { |card| card.match?(top_card) }
  end
end
