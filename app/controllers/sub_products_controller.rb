class SubProductsController < ApplicationController
  include Controllers::Crudify
  super_model_klass Spending
  model_klass SubProduct

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:sub_product).permit(:name, :quantity, :price, :spending_id)
  end
end
