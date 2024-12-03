class Sale < ApplicationRecord
  include Models::Searchable
  has_many :product_solds, dependent: :destroy
  belongs_to :collaborator, optional: true
  belongs_to :payment_method

  accepts_nested_attributes_for :product_solds, reject_if: :all_blank, allow_destroy: true

  expect_comma_for :invoicing

  default_scope { order(date: :desc) }

  def self.setProductEnum
    hash = {}

    Product.all.each do |product|
      hash[product.name] = product.id
    end

    hash
  end

  enum product: setProductEnum

  def self.setSellerEnum
    hash = {}

    Employee.seller.map do |seller|
      hash[seller.name] = seller.id
    end

    hash
  end

  enum seller: setSellerEnum

  scope :for_seller, -> { where(for_seller: true) }
end
