class ProductsController < ApplicationController
  include Controllers::Crudify
  model_klass Product

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product).permit(:name, :product_category_id, :price)
  end
end
