class Product < ApplicationRecord
  include Models::Searchable

  belongs_to :product_category
  has_many :fabrications, dependent: :delete_all

  expect_comma_for :price
  search_by :name
end
