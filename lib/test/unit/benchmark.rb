require "test/unit/benchmark/version"
require "test/unit"
require 'benchmark-perf'

module Test
  module Unit
    module Benchmark
      class Error < StandardError; end
      module TimeUnitShorthand
        refine Integer do
          def ms
            self / 1e3
          end

          def us
            self / 1e6
          end

          def ns
            self / 1e9
          end
        end
      end

      def self.configure(&block)
        config = configuration
        block.call(config)
        @config = config
      end

      def self.configuration
        (@config || default_configuration).dup
      end

      def self.reset_configuration
        @config = default_configuration
        nil
      end

      def self.default_configuration
        config = Struct.new(:repeat, :warmup, :subprocess, keyword_init: true)
        config.new(
          repeat: 1,
          warmup: 1,
          subprocess: false
        )
      end
    end

    module Assertions
      def assert_perform_under_sec(threshold, options = {}, &block)
        message = options.fetch(:message) { nil }
        repeat, warmup, subprocess = options.fetch_values(:repeat, :warmup, :subprocess) { nil }
        config = ::Test::Unit::Benchmark.configuration
        repeat ||= config.repeat
        warmup ||= config.warmup
        subprocess ||= config.subprocess

        average, stddev = ::Benchmark::Perf::ExecutionTime.run(repeat: repeat, warmup: warmup, subprocess: subprocess, &block)
        assert_operator average, :<=, threshold, message
      end
      alias_method :assert_perform_under, :assert_perform_under_sec

      def assert_perform_under_ms(threshold, options = {}, &block)
        assert_perform_under_sec(threshold / 1e3, options, &block)
      end

      def assert_perform_under_us(threshold, options = {}, &block)
        assert_perform_under_sec(threshold / 1e6, options, &block)
      end

      def assert_perform_under_ns(threshold, options = {}, &block)
        assert_perform_under_sec(threshold / 1e9, options, &block)
      end
    end
  end
end
