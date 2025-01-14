class Cost < ApplicationRecord
  belongs_to :product_cost

  expect_comma_for :price
  expect_comma_for :cost

  def self.set_products_enum
    products = Product.all.map do |product|
      [product.name, product.id]
    end

    Hash[products]
  end

  enum unit: { und: 0, g: 1, kg: 2, ml: 3, l: 4 }
  enum products: set_products_enum
end
