# frozen_string_literal: true

require_relative "card"

module UnoSimulation
  # In the interest of keeping the code simple, inheriting from Array.
  # In prod, don't inherit from core classes like Array, use forwardable
  # module instead.  Explanation here:
  #
  class Deck < Array
    def initialize
      deck = []

      # For each color, there is/are:
      %i[red green blue yellow].each do |color|
        # a single '0' card,
        deck << Card.new(color, 0)

        2.times do
          # 2 cards each with numbers 1-9,
          1.upto(9) { |number| deck << Card.new(color, number) }

          # 2 cards each with symbols 'reverse', 'skip' and 'draw 2'.
          %i[reverse skip draw_2].each { |symbol| deck << Card.new(color, symbol) }
        end
      end

      # Add 12 wild cards.
      4.times { deck << Card.new(:wild, :none) }
      4.times { deck << Card.new(:wild, :draw_4) }
      4.times { deck << Card.new(:wild, :customizeable) }

      super(deck)
    end

    # Draw a card from the deck that is numbered 1-9.
    #
    def draw_positive_numbered
      idx = index { |card| (1..9).cover?(card.number_or_symbol) }
      delete_at(idx)
    end

    alias_method :draw, :shift
  end
end
