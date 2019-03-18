# frozen_string_literal: true

# DoubleTranspositionCipher module
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    n, m = get_matrix_size(document.to_s)
    document = get_padded_string(document.to_s, n * m)
    matrix = document.chars.each_slice(n).map { |e| e }
    r_array = (0...n).to_a.shuffle!(random: Random.new(key))
    get_encrypted_string(matrix, r_array)
  end

  def self.decrypt(document, key)
    # TODO: FILL THIS IN!
    n = get_matrix_size(document.to_s)
    matrix = document.to_s.chars.each_slice(n).map { |e| e }
    r_array = (0...n).to_a.shuffle!(random: Random.new(key))
    get_decrypted_string(matrix, r_array)
  end

  def self.get_matrix_size(string)
    size = Integer.sqrt(string.length)
    return size, size unless string.length != size * size
    return size + 1, size unless string.length >= (size + 1) * size

    [size + 1, size + 1]
  end

  def self.get_padded_string(string, size)
    return string if string.length == size

    string + ([' '] * (size - string.length)).reduce { |n1, n2| "#{n1}#{n2}" }
  end

  def self.get_encrypted_string(matrix, r_array)
    encrypted = matrix.map do |row|
      row.map.with_index { |_v, i| row[r_array[i]] }
         .reduce { |n1, n2| "#{n1}#{n2}" }
    end
    encrypted.reduce { |n1, n2| "#{n1}#{n2}" }
  end

  def self.get_decrypted_string(matrix, r_array)
    decrypted = matrix.map do |row|
      row.map.with_index { |_v, i| row[r_array.index(i)] }
         .reduce { |n1, n2| "#{n1}#{n2}" }
    end
    decrypted.reduce { |n1, n2| "#{n1}#{n2}" }.strip
  end
end
