# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise/encryptable/encryptors/scrypt/version"

Gem::Specification.new do |gem|
  gem.name          = "devise-scrypt"
  gem.version       = Devise::Encryptable::Encryptors::SCRYPT_VERSION
  gem.authors       = ["Christoph Olszowka"]
  gem.email         = ["christoph at olszowka de"]
  gem.description   = %q{A devise-encryptable password encryptor that uses SCrypt}
  gem.summary       = %q{A devise-encryptable password encryptor that uses SCrypt}
  gem.homepage      = "https://github.com/capita/devise-scrypt"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'devise', '>= 2.1.0'
  gem.add_dependency 'devise-encryptable', '>= 0.1.1'
  gem.add_dependency 'scrypt', '>= 1.1.0'
end
