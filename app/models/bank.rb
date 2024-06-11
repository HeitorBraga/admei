class Bank < ApplicationRecord
  include Models::Searchable

  validates :code, :name, :ispb_code, presence: true

  search_by :code, :name

  def name_with_code
    "#{code} - #{name}"
  end
end
