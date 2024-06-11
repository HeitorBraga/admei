class City < ApplicationRecord
  include Models::Searchable

  validates :name, presence: true
  validates :ibge_code, uniqueness: true, presence: true
  belongs_to :state

  search_by :name
end
