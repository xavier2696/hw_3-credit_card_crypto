require 'rbnacl'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    data = simple_box.encrypt(document.to_s)
    Base64.strict_encode64(data)
  end

  def self.decrypt(document, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    data = Base64.strict_decode64(document)
    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    simple_box.decrypt(data)
  end
end
