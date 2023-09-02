require_relative 'deck'

module UnoSimulation
  module Scenarios

    # Create a deck and randomly draw a positive numbered card from it.
    # return both the deck (shuffled) and the card.
    # 
    def self.draw_positive_numbered()
      deck = UnoSimulation::Deck.new
      deck.shuffle!

      idx = deck.index { |card| (1..9).cover?(card.number_or_symbol) }
      positive_numbered_card = deck.delete_at(idx)

      deck.shuffle!

      [deck, positive_numbered_card]
    end

    # Player has no cards in hand that match the top card on the discard pile.
    # Draw from the deck until a matching/covering card is found.  
    # Return the cards that were drawn.
    # 
    # Precondition: at least one card in the deck will cover the top card.
    # 
    def self.draw_until_match(deck, top_card)
      deck.shuffle!
      drawn_cards = [deck.draw]

      until drawn_cards.last.match?(top_card)
        drawn_cards << deck.draw
      end

      drawn_cards
    end

    def self.experiment(verbose: false)
      deck, top_card = Scenarios.draw_positive_numbered()
      drawn_cards = Scenarios.draw_until_match(deck, top_card)

      if verbose
        puts "-" * 78
        puts top_card
        puts drawn_cards.map(&:to_s).join(',')
      end

      drawn_cards.size
    end
  end
end
