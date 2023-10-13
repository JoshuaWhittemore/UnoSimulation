# frozen_string_literal: true

# require "bundler/gem_tasks"
require "rake/testtask"
require_relative "lib/UnoSimulation"

require "byebug"

# $ rake test TESTOPTS='-v'
Rake::TestTask.new(:test) do |t|
  # #t.verbose = true
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "standard/rake"

# desc "cleanup"
# task :standard do
#   `standardrb --fix`
# end

DEFAULT_NUM_SAMPLES = "10"

desc "run"
task :run, [:num_samples, :verbose] do |t, args|
  num_samples = args.fetch(:num_samples, DEFAULT_NUM_SAMPLES).to_i
  verbose = args.fetch(:verbose, "false")

  # Convert command line arg from string to bool.
  verbose = verbose == "true"

  num_samples.times do
    n = UnoSimulation::Scenarios.experiment(verbose: verbose)
    print(n, " ")
  end
end

task default: %i[test standard:fix]
