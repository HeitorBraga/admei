class State < ApplicationRecord
  include Models::Searchable

  validates :name, presence: true
  validates :uf, presence: true
  validates :ibge_code, uniqueness: true, presence: true

  belongs_to :country
  has_many :cities

  search_by :name, :uf
end
