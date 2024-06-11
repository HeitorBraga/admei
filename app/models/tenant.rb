# frozen_string_literal: true

class Tenant < ApplicationRecord
  after_create :setup_tenant
  before_create :generate_tokens

  def self.current
    Tenant.find_by(subdomain: Apartment::Tenant.current)
  end

  private

  def create_default_data!
    Dir[File.join(Rails.root, 'db', 'defaults', '*.rb')].sort.each { |default| load default }
  end

  def setup_tenant
    Apartment::Tenant.create(subdomain)
    Apartment::Tenant.switch!(subdomain)

    create_default_data!
  end

  def generate_tokens
    self.public_token = SecureRandom.alphanumeric(32)
    self.secret_token = SecureRandom.alphanumeric(32)
  end
end
