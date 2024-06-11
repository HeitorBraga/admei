class Address < ApplicationRecord
  validates :zip, presence: true
  validates :address, presence: true
  validates :district, presence: true

  belongs_to :city
  belongs_to :addressable, polymorphic: true

  serialize :data

  def state_id
    self.city.try(:state).try(:id) || @state_id
  end

  def full_address
    full_address = "#{address}, "
    full_address << "#{number}, " unless number.blank?
    full_address << district

    full_address
  end

  def state_id=(value)
    @state_id = value
  end

  def self.permited_params
    {
      address_attributes: [
        :id, :addressable_id, :addressable_type, :zip, :address, :number, :more, :district,
        :city_id, :state_id
      ]
    }
  end
end
