class ProductCategoriesController < ApplicationController
  include Controllers::Crudify
  include Controllers::Searchable
  model_klass ProductCategory

  before_action :check_permissions

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.categories_and_products == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product_category).permit(:name)
  end
end
