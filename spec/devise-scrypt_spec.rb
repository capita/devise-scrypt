# encoding: utf-8
require 'spec_helper'

describe Devise::Encryptable::Encryptors::Scrypt do
  let(:scrypt)    { Devise::Encryptable::Encryptors::Scrypt }
  let(:salt)      { 'Salt gathered from the Dead Sea makes an excellent body scrub because of its high mineral content.' }
  let(:pepper)    { 'A Brazilian soccer player is pepper-sprayed after refusing to leave the pitch following a red card.' }
  let(:password)  { 'very!secret' }
  let(:stretches) { 10 }

  describe ".digest" do
    let(:digest) { scrypt.digest(password, stretches, salt, pepper) }

    it "builds a scrypt password hash" do
      expect(SCrypt::Password.new(digest)).to be == "#{password}#{salt}#{pepper}"
    end
  end

  describe ".compare" do
    let(:encrypted) { SCrypt::Password.create("#{password}#{salt}#{pepper}").to_s }

    it "is true when comparing an encrypted password against given plaintext" do
      expect(scrypt.compare(encrypted, password, stretches, salt, pepper)).to be_true
    end

    it "is false when comparing with wrong password" do
      expect(scrypt.compare(encrypted, 'foobar', stretches, salt, pepper)).to be_false
    end

    it "is false when comparing with correct password but wrong salt" do
      expect(scrypt.compare(encrypted, password, stretches, 'nope', pepper)).to be_false
    end

    it "is false when comparing with correct password but wrong pepper" do
      expect(scrypt.compare(encrypted, password, stretches, salt, 'nope')).to be_false
    end
  end

end