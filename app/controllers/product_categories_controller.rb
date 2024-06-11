class ProductCategoriesController < ApplicationController
  include Controllers::Crudify
  include Controllers::Searchable
  model_klass ProductCategory

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product_category).permit(:name)
  end
end
