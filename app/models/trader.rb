class Trader < ApplicationRecord
  include Models::Addressable
  include ActiveModel::Validations
  include Models::Searchable

  enum person_type: { natural: 0, legal: 1 }

  validates :name, presence: true
  validates :legal_name, presence: true, if: ->(record) { record.person_type == 'legal' }
  validates_with FederalTaxIdValidator

  serialize :data

  PROFILES = [:customer, :supplier, :carrier].freeze

  def search_data
    {
      name: name,
      profiles: profiles,
      legal_name: legal_name,
      person_type: person_type,
      federal_tax_id: federal_tax_id,
      email: email,
      phone: phone,
      mobile: mobile,
      ifood_id: data[:ifood_id],
      updated_at: updated_at,
    }
  end

  def profiles=(_profiles)
    _profiles.map!(&:to_sym)
    data[:profiles] = {
      customer: _profiles.include?(:customer),
      supplier: _profiles.include?(:supplier),
      carrier: _profiles.include?(:carrier),
    }
  end

  def profiles
    profiles = []
    profiles << :customer if customer?
    profiles << :supplier if supplier?
    profiles << :carrier if carrier?

    profiles
  end

  def customer?
    data[:profiles] && data[:profiles][:customer]
  end

  def supplier?
    data[:profiles] && data[:profiles][:supplier]
  end

  def carrier?
    data[:profiles] && data[:profiles][:carrier]
  end

  def display
    if phone.present?
      "#{name} - #{phone}"
    elsif mobile.present?
      "#{name} - #{mobile}"
    else # if delivery_app_id.present?
      name
    end
  end
end
