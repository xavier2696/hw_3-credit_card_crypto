# frozen_string_literal: true

require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  cc = CreditCard.new('4916603231464963', 'Mar-30-2020',
                      'Soumya Ray', 'Visa')
  key = 3
  encoded_values = [SubstitutionCipher::Caesar.encrypt(cc, key),
                    SubstitutionCipher::Permutation.encrypt(cc, key),
                    DoubleTranspositionCipher.encrypt(cc, key)]
  decoded_values = [SubstitutionCipher::Caesar.decrypt(encoded_values[0], key),
                    SubstitutionCipher::Permutation.decrypt(encoded_values[1],
                                                            key),
                    DoubleTranspositionCipher.decrypt(encoded_values[2], key)]
  encoded_decoded_array = [['Caesar', encoded_values[0], decoded_values[0]],
                           ['Permutation', encoded_values[1],
                            decoded_values[1]],
                           ['Double Transposition', encoded_values[2],
                            decoded_values[2]]]

  encoded_decoded_array.each do |c_name, enc, dec|
    describe "Using #{c_name} cipher" do
      it 'should encrypt card information correctly' do
        enc.wont_equal cc.to_s
        enc.wont_be_nil
        enc.must_be_instance_of String
      end

      it 'should decrypt text' do
        dec.must_equal cc.to_s
      end
    end
  end
end
