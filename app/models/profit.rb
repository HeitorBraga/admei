class Profit < ApplicationRecord
  def self.setEnum
    months = { set_month: 0 }

    if Sale.all.present?
      Sale.all.each do |sale|
        months[I18n.t(sale.date.month)] = sale.date.month
      end
    end
    if Spending.all.present?
      Spending.all.each do |spending|
        months[I18n.t(spending.date.month)] = spending.date.month
      end
    end

    months
  end

  enum months: setEnum

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

    cost
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

    invoicing
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
