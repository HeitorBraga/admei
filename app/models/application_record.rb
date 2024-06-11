class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Models::DecimalWithComma

  def self.tenant_index_name
    -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  end

  def to_gid_param
    IdEncoder.encode(Apartment::Tenant.current, model_name, id)
  end

  def broadcast_target_default
    [Apartment::Tenant.current, model_name.plural].join('_')
  end
end
