class FabricationsController < ApplicationController
  include Controllers::Crudify
  model_klass Fabrication

  before_action :check_registration_path, only: %i(index new)

  private

  def check_registration_path
    unless Product.count > 0
      redirect_to new_product_path, notice: 'Cadastre um Produto primeiro!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:fabrication).permit(:date, :product_id, :quantity)
  end
end
