# frozen_string_literal: true

require_relative "UnoSimulation/version"

module UnoSimulation
  class Error < StandardError; end
  # Your code goes here...
end

# $ ruby test/uno_test.rb -v

require "forwardable"

module UnoSimulation
  class Card
    attr_reader :color, :number_or_symbol

    def initialize(color, number_or_symbol)
      @color = color
      @number_or_symbol = number_or_symbol
    end

    # Return true if self can be placed on top of the top card
    # of the discard pile.
    #
    def covers?(top_card)
      return true if @color == :wild

      # Gotcha: not allowing cards with a '0' on them or with symbols: reverse, skip or
      # 'draw 2' to 'cover' the top card for reasons mentioned in writeup.
      if (0..9).cover?(@number_or_symbol)
        return true if @color == top_card.color
        return true if @number_or_symbol == top_card.number_or_symbol
      end

      false
    end
  end

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

      # There are 4 wild cards with symbol 'draw 4'.
      4.times { deck << Card.new(:wild, :draw_4) }

      # There are 4 wild cards without a symbol at all.
      4.times { deck << Card.new(:wild, :none) }

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
