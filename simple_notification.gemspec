# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_notification/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_notification"
  spec.version       = SimpleNotification::VERSION
  spec.authors       = ["Cong Wang"]
  spec.email         = ["findcongwang@gmail.com"]
  spec.summary       = %q{Simple user notification module.}
  spec.description   = %q{User notification system assuming user systems is built using the User model and has current_user helper. This gem uses the Notification model so must not be taken.}
  spec.homepage      = "https://github.com/findcongwang"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
end
