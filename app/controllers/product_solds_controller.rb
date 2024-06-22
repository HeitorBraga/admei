class ProductSoldsController < ApplicationController
  include Controllers::Crudify
  model_klass ProductSold

  private
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product_sold).permit(:sale_id, :product, :quantity)
  end
end
