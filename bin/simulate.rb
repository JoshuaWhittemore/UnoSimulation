#!/usr/bin/env ruby

require_relative '../lib/UnoSimulation'

require 'byebug'


require 'slop'  # Simple Lightweight Options Parsing
# https://www.rubydoc.info/gems/slop/4.10.1

opts = Slop.parse do |o|
  o.integer '-n', '--num_samples', 'number of samples to draw, default is 10.', default: 10
  o.bool '-v', '--verbose', 'enable verbose mode', default: false

#TODO: ability to set random seed too, with -s --seed

  o.on '-h', '--help' do
    puts o
    exit
  end
end


opts[:num_samples].times do 
  n = UnoSimulation::Scenarios.experiment(verbose: opts[:verbose])
  print(n, " ")
end


