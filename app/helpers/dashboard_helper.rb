module DashboardHelper
  def sales(month)
    @sales = 0.0

    Sale.all.each do |sale|
      if sale.date.month == month.to_i
        @sales += sale.invoicing
      end
    end

    @sales
  end

  def spendings(month)
    @spendings = 0.0

    Spending.all.each do |spending|
      if spending.date.month == month.to_i
        @spendings += spending.price
      end
    end

    @spendings
  end

  def profit(sales, spendings)
    @profit = sales - spendings
  end
end
