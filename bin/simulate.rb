#!/usr/bin/env ruby

require_relative '../lib/uno.rb'

require 'slop'  # simple lightweight options parsing
# https://www.rubydoc.info/gems/slop/4.10.1

opts = Slop.parse do |o|
  o.integer '-n', '--num_samples', 'number of samples to draw, default is 100.', default: 100

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
    deck = Uno::Deck.new.shuffle


    positive_numbered_card = deck.draw_positive_numbered()
    deck.shuffle!

    [deck, positively_numbered_card]
  end

  # Player has no cards in hand that match the top card on the discard pile.
  # Draw from the deck until a matching/covering card is found.  
  # Return the cards that were drawn.
  # 
  # Precondition: at least one card in the deck will cover the top card.
  # 
  def self.draw_until_match(deck, top_card)
    drawn_cards = []

    drawn_cards << deck.draw until drawn_cards.first.covers?(top_card)

    drawn_cards
  end

end


deck, top_card = Scenarios.draw_positive_numbered()
drawn_cards = Scenarios.draw_until_match(deck, top_card)

pp drawn_cards
exit



def experiment 
  deck = Uno::Deck.new
  deck.shuffle!
  top_card = deck.draw_positive_numbered()
  deck.shuffle!
  
  hand = []
  hand << deck.draw
  
  hand << deck.draw until hand.last.covers?(top_card)
  
  hand.size
end

total_draws = []

opts[:num_samples].times do 
  total_draws << experiment()
end

puts total_draws.join(' ')