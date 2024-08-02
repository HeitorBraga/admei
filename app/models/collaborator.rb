class Collaborator < ApplicationRecord
  has_many :sales, dependent: :destroy
end
