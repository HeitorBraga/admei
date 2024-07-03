class SalesController < ApplicationController
  include Controllers::Crudify
  model_klass Sale

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:sale).permit(:date, :invoicing,
                                 product_solds_attributes: %i(id product quantity _destroy))
  end
end
