class TradersController < ApplicationController
  include Controllers::Crudify

  model_klass Trader

  def new
    @trader = Trader.new
    @trader.build_address
  end

  def edit
    @trader.build_address if @trader.address.nil?
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:trader).permit(
      :person_type, :name, :legal_name, :federal_tax_id, :state_tax_id,
      :municipal_tax_id, :gender, :phone, :mobile, :email, :birth_date,
      Address.permited_params.merge(profiles: [])
    )
  end
end
