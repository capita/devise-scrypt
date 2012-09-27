require 'scrypt'

module Devise
  module Encryptable
    module Encryptors
      #
      # An encryptor for Devise passwords that uses the SCrypt algorithm.
      # You will need the devise-encryptable gem. Then you can switch to
      # scrypt by setting `config.encryptor = :scrypt` in your devise config.
      #
      # Stretches are ignored as SCrypt has different concepts for increasing
      # calculation complexity.
      #
      # As this uses the `scrypt` ruby gem you can configure the complexity
      # by setting defaults there, like so:
      #
      #     SCrypt::Engine::DEFAULTS[:key_len] = 128
      #     SCrypt::Engine::DEFAULTS[:salt_size] = 64
      #
      # Find out more about SCrypt here:
      #
      #   * https://github.com/pbhogan/scrypt
      #   * http://www.tarsnap.com/scrypt.html
      #
      class Scrypt < Base
        def self.digest(password, stretches, salt, pepper)
          SCrypt::Password.create("#{password}#{salt}#{pepper}").to_s
        end

        def self.compare(encrypted_password, password, stretches, salt, pepper)
          SCrypt::Password.new(encrypted_password) == "#{password}#{salt}#{pepper}"
        end
      end
    end
  end
end