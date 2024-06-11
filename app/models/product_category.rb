class ProductCategory < ApplicationRecord
  include Models::Searchable

  search_by :name
end
