# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.verbose = true
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
task :run, [:num_samples] do |t, args|
  num_samples = args.fetch(:num_samples, DEFAULT_NUM_SAMPLES).to_i
  puts "num_samples: #{num_samples}, class: #{num_samples.class}"
end

task default: %i[test standard:fix]

#####################

# $ rake --tasks
# rake run[num_samples]  # run
# rake standard          # cleanup
# rake test              # Run tests
# task default: "test"

# Rake::TestTask.new do |task|
#   task.verbose = true
#   task.pattern = "test/*_test.rb"
# end

# task default: [:test, :standard]
