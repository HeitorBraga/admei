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
end
