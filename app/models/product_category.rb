class ProductCategory < ApplicationRecord
  include Models::Searchable

  search_by :name
  has_many :products
end
