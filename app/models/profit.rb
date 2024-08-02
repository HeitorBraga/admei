class Profit < ApplicationRecord
  def self.setMonths
    months = []

    if Sale.all.present?
      Sale.all.each do |sale|
        unless months.include? sale.date.strftime("%b")
          months.push(sale.date.strftime("%b"))
        end
      end
    end

    if Spending.all.present?
      Spending.all.each do |spending|
        unless months.include? spending.date.strftime("%b")
          months.push(spending.date.strftime("%b"))
        end
      end
    end

    months
  end

  def self.setProfit(month)
    setInvoicing(month) - setCost(month)
  end

  def self.setCost(month)
    cost = 0.0

    Spending.all.each do |spending|
      if month.present? && spending.date.month.to_i == month
        cost += spending.price
      elsif month.blank? || month == 0
        cost += spending.price
      end
    end

    cost.round(2)
  end

  def self.setInvoicing(month)
    invoicing = 0.0

    Sale.all.each do |sale|
      if month.present? && sale.date.month.to_i == month
        invoicing += sale.invoicing
      elsif month.blank? || month == 0
        invoicing += sale.invoicing
      end
    end

    invoicing.round(2)
  end

  def self.setSales(month)
    sales = {}

    Sale.all.each do |sale|
      sale.product_solds.each do |product_sold|
        Product.all.each do |product|
          if product.id == product_sold.product
            if month.present? && sale.date.month.to_i == month
              if sales[product.name].present?
                sales[product.name] = (sales[product.name].to_i + product_sold.quantity).to_s
              else
                sales[product.name] = product_sold.quantity.to_s
              end
            elsif month.blank? || month == 0
              if sales[product.name].present?
                sales[product.name] = (sales[product.name].to_i + product_sold.quantity).to_s
              else
                sales[product.name] = product_sold.quantity.to_s
              end
            end
          end
        end
      end
    end

    sales
  end

  def self.setCollaboratorsSales(month)
    sales = 0.0

    Sale.all.each do |sale|
      if month.present? && sale.date.month.to_i == month && (sale.for_collaborator? && sale.collaborator_id.present?)
        sales += sale.invoicing
        end
    end

    sales
  end

  def self.setCollaboratorsRanking(month)
    ranking = {}

    Collaborator.all.each do |coll|
      invoicing = 0.0
      coll.sales.all.each do |sale|
        if month.present? && sale.date.month.to_i == month
          invoicing += sale.invoicing
        end
      end

      ranking[coll.name] = invoicing
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
      if month.present? && sale.date.month == month
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
