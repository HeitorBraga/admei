class Employee < ApplicationRecord
  include Models::Addressable

  has_many :employee_absences
  has_many :employee_overtime

  validates :receives, presence: true

  belongs_to :company_position

  expect_comma_for :wage

  enum receives_when: {
    weekly: 0, biweekly: 1, monthly: 2,
  }

  scope :active, -> { where(came_out_in: nil) }
  scope :seller, -> { where(commission: true, came_out_in: nil) }
end
