# UnoSimulation

####################################################################################
# TODO
## Required
* Don't subclass array, it has caused you issues.
* Call simulate.rb from the rake task, add option to do it verbosely to rake task.
* Make it work:
    1. the executable should work with both options.


## Nice to have
* remove gemspec file from this project
* remove folders/files that you don't understand, don't think you're going to need.
* call to rake with z-shell
* improve test coverage


## Formatting/Renaming (do these at the end)
* change name of project from UnoSimulation to just Uno
* add nice instructions to readme to install project, to run project, to run project tests, and to run project tests with rake tasks

## Optional
* -v, --verbose option which shows what the top card was and what the drawn cards were.


# REQUIRMENTS, MAIN


#####################

```zsh
$ rake --tasks
rake run[num_samples]  # run
rake standard          # cleanup
rake test              # Run tests
task default: "test"

Rake::TestTask.new do |task|
  task.verbose = true
  task.pattern = "test/*_test.rb"
end

task default: [:test, :standard]
```


####################################################################################

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/UnoSimulation`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/UnoSimulation.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
