class PayLatter < ApplicationRecord
  expect_comma_for :price
  belongs_to :payment_method

  collaborators_hash = {}
  Collaborator.all.each do |collaborator|
    collaborators_hash[collaborator.name] = collaborator.id
  end

  enum collaborator_enum: collaborators_hash
end
