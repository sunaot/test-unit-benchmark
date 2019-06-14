require "test_helper"

class BenchmarkTest < Test::Unit::TestCase
  def test_perform_under_sec
    assert_perform_under_sec(1) { sleep 0.1 }
  end

  def test_perform_under_ms
    assert_perform_under_ms(10) { sleep 0.005 }
  end

  def test_perform_under_with_options
    i = 0
    assert_perform_under(1, warmup: 10) { i += 1; sleep 0.001 }
    assert_equal 10+1, i
  end

  def test_default_options
    Test::Unit::Benchmark.reset_configuration

    config = Test::Unit::Benchmark.configuration
    assert_equal 1, config.repeat
    assert_equal 1, config.warmup
    assert_equal false, config.subprocess
  end

  def test_configure_repeat_option
    Test::Unit::Benchmark.configure do |config|
      config.repeat = 3
    end

    config = Test::Unit::Benchmark.configuration
    assert_equal 3, config.repeat
  end

  def test_configure_warmup_option
    Test::Unit::Benchmark.configure do |config|
      config.warmup = 2
    end

    config = Test::Unit::Benchmark.configuration
    assert_equal 2, config.warmup
  end

  def test_configure_subprocess_option
    Test::Unit::Benchmark.configure do |config|
      config.subprocess = true
    end

    config = Test::Unit::Benchmark.configuration
    assert_equal true, config.subprocess
  end

  using Test::Unit::Benchmark::TimeUnitShorthand
  def test_ms_shorthand
    assert_equal 5 / 1e3, 5.ms
  end

  def test_us_shorthand
    assert_equal 5 / 1e6, 5.us
  end

  def test_ns_shorthand
    assert_equal 5 / 1e9, 5.ns
  end
end
