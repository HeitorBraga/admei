class ProductsController < ApplicationController
  include Controllers::Crudify
  model_klass Product
  before_action :check_registration_path, only: %i(index new)

  def check_registration_path
    unless ProductCategory.count > 0
      redirect_to new_product_category_path, notice: 'Cadastre uma categoria primeiro!'
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product).permit(:name, :product_category_id, :price)
  end
end
