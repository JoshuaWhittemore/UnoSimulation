require_relative "deck"
require "byebug"

module UnoSimulation
  module Scenarios
    # Create a deck and randomly draw a positive numbered card from it.
    # return both the deck (shuffled) and the card.
    #
    def self.draw_positive_numbered
      deck = UnoSimulation::Deck.new
      deck.cards.shuffle!

      # Pull the first card numbered 1-9 from the deck.
      idx = deck.cards.index { |card| (1..9).cover?(card.number_or_symbol) }
      positive_numbered_card = deck.cards.delete_at(idx)

      [deck, positive_numbered_card]
    end

    # Player has no cards in hand that match the top card on the discard pile.
    # Draw from the deck until a matching/covering card is found.
    # Return the cards that were drawn.
    #
    # Precondition: at least one card in the deck will cover the top card.
    #
    def self.draw_until_match(deck, top_card)
      deck.cards.shuffle!
      drawn_cards = []

      loop do 
        card = deck.draw
        drawn_cards << card

        # If it is a skip, draw2 or reverse card do not check if it matches, since
        # in a 2 player game, these cards result in skipping the other player's turn
        # and you'll have to keep drawing anyway.
        next if %i[skip draw2 reverse].member?(card.number_or_symbol)

        break if card.match?(top_card)
      end

      drawn_cards
    end

    def self.experiment(verbose: false)
      deck, top_card = Scenarios.draw_positive_numbered
      drawn_cards = Scenarios.draw_until_match(deck, top_card)

      if verbose
        puts "-" * 78
        puts top_card
        puts drawn_cards.map(&:to_s).join(",")
      end

      drawn_cards.size
    end
  end
end
