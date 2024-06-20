class SubProduct < ApplicationRecord
  belongs_to :spending

  expect_comma_for :price
end
