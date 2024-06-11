class Company < ApplicationRecord
  include Models::Addressable
  include Models::Searchable

  search_by :trade_name, :legal_name, :federal_tax_id

  validates :trade_name, :legal_name, :federal_tax_id, presence: true
  validates :certificate_password, presence: true, if: :certificate_present?
  validate :validates_certificate_password, if: :certificate_present?

  has_one_attached :certificate

  def certificate_password=(value)
    return if persisted? && value.blank?

    super(value)
  end

  def to_s
    "#{trade_name} (#{legal_name})"
  end

  private

  def certificate_present?
    certificate.attached?
  end

  def validates_certificate_password
    OpenSSL::PKCS12.new(certificate.download, certificate_password)
  rescue OpenSSL::PKCS12::PKCS12Error => e
    errors.add(:certificate_password, 'incorrect')
  end
end
