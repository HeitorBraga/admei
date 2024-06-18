class Cost < ApplicationRecord
  belongs_to :product_cost

  expect_comma_for :price

  enum unit: { und: 0, g: 1, kg: 2, ml: 3, l: 4 }
end
