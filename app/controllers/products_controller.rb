class ProductsController < ApplicationController
  include Controllers::Crudify
  model_klass Product
  before_action :check_registration_path, only: %i(index new)
  before_action :check_permissions

  def check_registration_path
    unless ProductCategory.count > 0
      redirect_to new_product_category_path, notice: 'Cadastre uma categoria primeiro!'
    end
  end

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.categories_and_products == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product).permit(:name, :product_category_id, :price)
  end
end
