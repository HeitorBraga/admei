class Sale < ApplicationRecord
  has_many :product_solds, dependent: :delete_all

  accepts_nested_attributes_for :product_solds, reject_if: :all_blank, allow_destroy: true

  expect_comma_for :invoicing

  def self.setEnum
    hash = {}
    position = 0

    Product.all.each do |product|
      hash[product.name] = position
      position += 1
    end

    hash
  end

  enum product: setEnum
end
