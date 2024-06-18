class ProductCost < ApplicationRecord
  belongs_to :product
  has_many :costs, dependent: :delete_all

  accepts_nested_attributes_for :costs, reject_if: :all_blank, allow_destroy: true
end
