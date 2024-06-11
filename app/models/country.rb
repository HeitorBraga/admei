class Country < ApplicationRecord
  include Models::Searchable

  validates :name, presence: true
  validates :iso_code, uniqueness: true, presence: true
  validates :ibge_code, uniqueness: true, presence: true

  search_by :name, :iso_code, ibge_code: :equals
end
