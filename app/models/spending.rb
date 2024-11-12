class Spending < ApplicationRecord
  has_many :sub_products, dependent: :delete_all
  belongs_to :payment_method

  expect_comma_for :price

  accepts_nested_attributes_for :sub_products, reject_if: :all_blank, allow_destroy: true

  default_scope { order(date: :desc) }
end
