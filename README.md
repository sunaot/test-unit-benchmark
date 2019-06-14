# Test::Unit::Benchmark

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'test-unit-benchmark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install test-unit-benchmark

## Usage

```ruby
require "test/unit"
require "test/unit/benchmark"

class BenchmarkTest < Test::Unit::TestCase
  def test_perform_under_sec
    assert_perform_under(1) { sleep 0.1 }
  end

  def test_ultra_fast
    assert_perform_under_ns(1) do
      # do ultra fast
    end
  end
end
```

### TimeUnit Shorthand

```ruby
class BenchmarkTest < Test::Unit::TestCase
  using ::Test::Unit::Benchmark::TimeUnitShorthand
  def test_ultra_fast
    assert_perform_under(1.ns) do
      # do ultra fast
    end
  end
end
```

### Configuration

```ruby
Test::Unit::Benchmark.configure do |config|
  config.repeat = 3 # times
  config.warmup = 2 # times
  config.subprocess = true # boolean
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sunaot/test-unit-benchmark. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Test::Unit::Benchmark project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sunaot/test-unit-benchmark/blob/master/CODE_OF_CONDUCT.md).
