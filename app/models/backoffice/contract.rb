class Backoffice::Contract < ApplicationRecord
  before_create :generate_key

  expect_comma_for :price

  private

  def generate_key
    return unless self.contract_key.blank?

    chars = ('A'..'Z').to_a + (0..9).to_a
    begin
      _key = (0...12).collect { chars[Kernel.rand(chars.length)] }.join
    end while Backoffice::Contract.find_by(contract_key: _key)

    self.contract_key = _key.scan(/..../).join('-')
  end
end
