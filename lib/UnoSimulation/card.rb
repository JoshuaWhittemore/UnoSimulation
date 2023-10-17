module UnoSimulation
  class Card
    attr_reader :color, :number_or_symbol

    VALID_COLORS = %i[red green blue yellow]

    def initialize(color, number_or_symbol)
      @color = color
      @number_or_symbol = number_or_symbol
    end

    # Return true if self can be placed on top of the top card
    # of the discard pile.
    #
    def match?(top_card)
      @color == :wild ||
        @color == top_card.color ||
        @number_or_symbol == top_card.number_or_symbol
    end

    def to_s
      "(#{color}|#{number_or_symbol})"
    end
  end
end
