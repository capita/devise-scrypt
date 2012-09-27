devise-scrypt [![Build Status](https://secure.travis-ci.org/capita/devise-scrypt.png)][Continuous Integration]
=============

**A [devise-encryptable] password encryptor that uses [SCrypt]**

  * [Source Code]
  * [API documentation]
  * [Rubygem]
  * [Continuous Integration]

[Source Code]: https://github.com/capita/devise-scrypt "Source Code @ GitHub"
[API documentation]: http://rubydoc.info/gems/devise-scrypt/frames "API Documentation at Rubydoc.info"
[Rubygem]: http://rubygems.org/gems/devise-scrypt "Rubygem @ rubygems.org"
[Continuous Integration]: http://travis-ci.org/capita/devise-scrypt "Continuous integration @ travis-ci.org"

[SCrypt]: https://github.com/pbhogan/scrypt "scrypt rubygem"
[devise]: https://github.com/plataformatec/devise "devise rubygem"
[devise-encryptable]: https://github.com/plataformatec/devise-encryptable "devise-encryptable plugin"


## Usage

Assuming you have [devise] (>= 2.1) and the [devise-encryptable] plugin
set up in your application, add `devise-scrypt` to your `Gemfile` and `bundle`:

    gem 'devise-scrypt'

Then open up your [devise] configuration, which supposedly lives at
`config/initializers/devise.rb` and configure your encryptor to be `scrypt`:

    # config/initializers/devise.rb
    Devise.setup do |config|
      # ..
      config.encryptor = :scrypt
      # ...
    end

It is also recommended to uncomment (or add) `config.pepper` with a random
string that will be used in addition to the per-user `password_salt` when hashing.

## Configuring algorithm complexity

The `config.stretches` option does not affect the calculation complexity. Instead,
please adjust the `scrypt` defaults to your liking. Please note that in the test
environment you will probably want to reduce complexity if you find your test suite
slows down significantly. Please refer to the [SCrypt] gem documentation about SCrypt
config options and their effect.

    # Example config:
    SCrypt::Engine::DEFAULTS[:key_len] = 64
    SCrypt::Engine::DEFAULTS[:salt_size] = 32

## [Compatibility][Continuous Integration]

The [test suite passes against][Continuous Integration] MRI 1.8.7, 1.9.2, 1.9.3, REE,
and Rubinius in both 1.8 and 1.9 modes.

JRuby is not supported because the [SCrypt] gem is a C extension and therefore is
incompatible with it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Christoph Olszowka, Capita Unternehmensberatung GmbH

Released under MIT License. See `LICENSE.txt`