# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bot_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "bot_logger"
  spec.version       = BotLogger::VERSION
  spec.authors       = ["Jan David"]
  spec.email         = ["jandavid@awesometechnology.de"]

  spec.summary       = %q(Simple logging facility for Ruby bots in The AI Games' challenges)
  spec.description   = <<-EOF
    This library provides a simple logging facility for Ruby bots in the AI challenges hosted by The AI Games. It
    offers multiple log levels, and outputs the logs in a meaningful format for easier debugging or optimizing.
  EOF
  spec.homepage      = "https://github.com/jdno/bot_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5.1"
end
