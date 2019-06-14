
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "test/unit/benchmark/version"

Gem::Specification.new do |spec|
  spec.name          = "test-unit-benchmark"
  spec.version       = Test::Unit::Benchmark::VERSION
  spec.authors       = ["sunaot"]
  spec.email         = ["sunao.tanabe@gmail.com"]

  spec.summary       = %q{sample}
  spec.description   = %q{sample}
  spec.homepage      = "https://github.com/sunaot/test-unit-benchmark"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "benchmark-perf"
  spec.add_dependency "test-unit"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
