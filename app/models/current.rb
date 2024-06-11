# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :tenant_name
  attribute :request_id, :user_agent, :ip_address
  attribute :company_id
  attribute :user_id

  resets { Time.zone = nil }

  def company
    Company.find(company_id)
  end

  def user
    User.find(user_id)
  end

  def backoffice?
    tenant_name == 'backoffice'
  end

  def accountant?
    Tenant.find_by(subdomain: tenant_name).profile == 'accountant'
  rescue
    false
  end
end
