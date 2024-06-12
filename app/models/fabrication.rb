class Fabrication < ApplicationRecord
  belongs_to :product

  default_scope { order(created_at: :desc) }
end
