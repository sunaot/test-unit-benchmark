require "test_helper"

class Test::Unit::BenchmarkTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Test::Unit::Benchmark::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
