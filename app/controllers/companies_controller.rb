class CompaniesController < ApplicationController
  include Controllers::Crudify
  before_action :check_company_present, only: %i(new)

  model_klass Company

  def new
    super
    @company.build_address
  end

  def edit
    super
    @company.build_address if @company.address.nil?
  end

  def show
    @address = @company.address
  end

  def check_company_present
    if Company.last.present?
      redirect_to company_url(Company.last.id), notice: "Você já tem uma empresa criada!"
    end
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
