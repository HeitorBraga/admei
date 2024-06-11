class Product < ApplicationRecord
  include Models::Searchable

  belongs_to :product_category

  expect_comma_for :price
  search_by :name
end
