# frozen_string_literal: true

# SubstitutionCipher module
module SubstitutionCipher
  # Caesar module
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      document.to_s.chars.map(&:ord).map { |i| i + key }.map(&:chr)
              .reduce { |n1, n2| n1 + n2 }
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      document.to_s.chars.map(&:ord).map { |i| i - key }.map(&:chr)
              .reduce { |n1, n2| n1 + n2 }
    end
  end
  # Permutation module
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      lookup_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.to_s.chars.map(&:ord).map { |i| lookup_table[i] }.map(&:chr)
              .reduce { |n1, n2| n1 + n2 }
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      lookup_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.to_s.chars.map(&:ord)
              .map { |i| lookup_table.index(i) }.map(&:chr)
              .reduce { |n1, n2| n1 + n2 }
    end
  end
end
