class SpendingsController < ApplicationController
  before_action :check_prices, only: %i(create update)
  include Controllers::Crudify
  model_klass Spending

  private

  def check_prices
    total_price = 0.0

    if params['spending']['sub_products_attributes'].present?
      params['spending']['sub_products_attributes'].each do |sub_product|
        quantity = sub_product[1]['quantity'].to_i
        price = sub_product[1]['price'].gsub(/[R$]/, '').gsub(/,/, '.').to_f * quantity

        total_price += price
      end

      spending_price = params['spending']['price'].gsub(/[R$]/, '').gsub(/,/, '.').to_f

      if total_price != spending_price
        redirect_to spendings_url, alert: 'O preço total e o preço dos produtos não é igual'
      end
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:spending).permit(:origin, :date, :price,
                                     sub_products_attributes: %i(id name quantity price _destroy))
  end
end
