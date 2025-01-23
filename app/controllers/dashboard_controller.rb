class DashboardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    months = [
      "set_month", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
      "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro",
    ]

    if params["month"].present?
      @month = months.index(params["month"])
    else
      @month = Date.current.month
    end

    if params["year"].present?
      @year = params["year"]
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>"
      puts params["year"]
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>"
    else
      @year = Date.current.year
    end

    @items = Profit.setSales(@month, @year)
  end
end
