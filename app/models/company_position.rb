class CompanyPosition < ApplicationRecord
  has_many :employees, dependent: :destroy
end