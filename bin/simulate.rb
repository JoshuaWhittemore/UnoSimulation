#!/usr/bin/env ruby


# $ ruby test/uno_test.rb -v

require_relative '../lib/UnoSimulation'

require 'byebug'

require 'slop'  # Simple Lightweight Options Parsing
# https://www.rubydoc.info/gems/slop/4.10.1

opts = Slop.parse do |o|
  o.integer '-n', '--num_samples', 'number of samples to draw, default is 100.', default: 100
  o.bool '-v', '--verbose', 'enable verbose mode', default: false

  o.on '-h', '--help' do
    puts o
    exit
  end
end


# should I move this into the class, somehow?
# should I make a class called 'scenarios?'


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

  def self.experiment()
    deck, top_card = Scenarios.draw_positive_numbered()
    drawn_cards = Scenarios.draw_until_match(deck, top_card)

    puts "-" * 78
    puts top_card
    puts drawn_cards.map(&:to_s).join(',')

    drawn_cards.size
  end




end


10.times do 
  n = Scenarios.experiment()
  puts n
end


