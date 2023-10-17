# frozen_string_literal: true

require "test_helper"

class UnoCardTest < Minitest::Test
  def test_card_matching
    yellow_2 = UnoSimulation::Card.new(:yellow, 2)
    red_9 = UnoSimulation::Card.new(:red, 9)
    red_2 = UnoSimulation::Card.new(:red, 2)
    wild = UnoSimulation::Card.new(:wild, 9)

    assert yellow_2.match?(red_2)
    assert red_9.match?(red_2)
    assert wild.match?(red_2)

    assert !yellow_2.match?(red_9)
  end
end
