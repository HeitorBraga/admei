class Profit < ApplicationRecord
  def self.setMonths
    if Sale.count != 0
      months = Sale.all.map do |sale|
        sale.date.strftime("%b")
      end

      months.push(Date.current.strftime("%b"))
      months = months.to_set
    end

    months
  end

  def self.setProfit(month)
    setInvoicing(month) - setCost(month)
  end

  def self.setCost(month)
    cost = Spending.all.map do |spending|
      if spending.date.month.to_i == month
        spending.price
      else
        0.0
      end
    end

    cost.inject(0) { |sum, x| sum + x }.round(2)
  end

  def self.setInvoicing(month)
    invoicing = Sale.all.map do |sale|
      if sale.date.month.to_i == month
        sale.invoicing
      else
        0.0
      end
    end

    invoicing.inject(0) { |sum, x| sum + x }.round(2)
  end

  def self.setSales(month)
    sales = Sale.all.map do |sale|
      if sale.date.month.to_i == month
        product_solds = sale.product_solds.map do |product_sold|
          product_sold.quantity
        end

        product_solds.inject(0) { |sum, x| sum + x }
      else
        0
      end
    end

    sales.inject(0) { |sum, x| sum + x }
  end

  def self.setCollaboratorsSales(month)
    sales = Sale.all.map do |sale|
      if sale.date.month.to_i == month && (sale.for_collaborator? && sale.collaborator_id.present?)
        sale.invoicing
      else
        0.0
      end
    end

    sales.inject(0) { |sum, x| sum + x }
  end

  def self.setCollaboratorsRanking(month)
    ranking = {}

    Collaborator.all.each do |coll|
      invoicing = coll.sales.all.map do |sale|
        if sale.date.month.to_i == month
          sale.invoicing
        else
          0.0
        end
      end

      ranking[coll.name] = invoicing.inject(0) { |sum, x| sum + x }
    end

    ranking.each do |key, value|
      if value == 0.0
        ranking.delete(key)
      end
    end

    ranking.sort_by(&:last).reverse.first(4).to_h
  end

  def self.setProductSalesRanking(month)
    ranking = {}

    Sale.all.each do |sale|
      if sale.date.month == month
        sale.product_solds.each do |sold|
          quantity = 0

          quantity += sold.quantity
          product_name = Product.find_by(id: sold.product).name

          if ranking[product_name].present?
            ranking[product_name] = ranking[product_name] + quantity
          else
            ranking[product_name] = quantity
          end
        end
      end
    end

    ranking.sort_by(&:last).reverse.first(4).to_h
  end

  def self.setRateOfGrowth(month)
    last_month = setInvoicing(month - 1)
    current_month = setInvoicing(month)

    if last_month != 0.0 && current_month != 0.0
      total = (current_month * 100) / last_month
      growth = total - 100
    else
      growth = 0
    end

    growth.round(2)
  end
end
