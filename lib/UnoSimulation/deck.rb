# frozen_string_literal: true

require "forwardable"
require_relative "card"

module UnoSimulation
  # Code would be a little simpler if Deck was subclassed from Array, but b
  # subclassing core classes can lead to some unexpected side effects.
  #
  class Deck
    extend Forwardable
    def_delegator :@cards, :shuffle!, :shuffle!
    def_delegator :@cards, :shift, :draw
    def_delegator :@cards, :size, :size
    def_delegator :@cards, :index, :index

    attr_reader :cards

    # FIXME: what is correct way of having an instance variable, is it attr ? attr_reader etc?
    def initialize
      @cards = []

      # For each color, there is/are:
      Card::VALID_COLORS.each do |color|
        # a single '0' card,
        @cards << Card.new(color, 0)

        2.times do
          # 2 cards each with numbers 1-9,
          1.upto(9) { |number| @cards << Card.new(color, number) }

          # 2 cards each with symbols 'reverse', 'skip' and 'draw 2'.
          %i[reverse skip draw2].each { |symbol| @cards << Card.new(color, symbol) }
        end
      end

      # Add 12 wild cards.
      4.times { @cards << Card.new(:wild, :none) }
      4.times { @cards << Card.new(:wild, :draw4) }
      4.times { @cards << Card.new(:wild, :customizeable) }
    end

    # Draw a card from the deck that is numbered 1-9.
    #
    def draw_positive_numbered
      idx = @cards.index { |card| (1..9).cover?(card.number_or_symbol) }
      @cards.delete_at(idx)
    end
  end
end
