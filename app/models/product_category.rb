class ProductCategory < ApplicationRecord
  include Models::Searchable

  search_by :name
  has_many :products, dependent: :delete_all
end
