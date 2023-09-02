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
    def match?(top_card)
      return true if @color == :wild

      # Gotcha: not allowing cards with a '0' on them or with symbols: reverse, skip or
      # 'draw 2' to 'cover' the top card for reasons mentioned in writeup.
      if (0..9).cover?(@number_or_symbol)
        return true if @color == top_card.color
        return true if @number_or_symbol == top_card.number_or_symbol
      end

      false
    end

    def to_s
      "(#{color}|#{number_or_symbol})"
    end
  end
end
