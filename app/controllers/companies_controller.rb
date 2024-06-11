class CompaniesController < ApplicationController
  include Controllers::Crudify

  model_klass Company

  def new
    super
    @company.build_address
  end

  def edit
    super
    @company.build_address if @company.address.nil?
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:company).permit(
      :trade_name, :legal_name, :federal_tax_id, :state_tax_id,
      :certificate, :certificate_password, Address.permited_params
    )
  end
end
