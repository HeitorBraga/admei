class CashRegister < ApplicationRecord
  belongs_to :payment_method

  expect_comma_for :amount

  def self.amount_available()
    amounts_per_month = []

    Profit.setMonths.each do |month|
      month_number = month.to_date.strftime("%m").to_i
      month_profit = Profit.setProfit(month_number)
      month_cash = 0.0

      CashRegister.where(month: month_number).each do |cash|
        if cash.add_money == true
          month_cash += cash.amount
        else
          month_cash -= cash.amount
        end
      end

      amounts_per_month.push(month_cash + month_profit)
    end

    amounts_per_month.sum.round(2)
  end

  def self.set_months_enum
    months = {}

    Profit.setMonths.each do |month|
      month_number = month.to_date.strftime("%m").to_i
      months[I18n.t("months." + month.downcase)] = month_number
    end

    months
  end

  enum month_enum: set_months_enum

  def self.set_wallet_labels
    labels = []

    if PaymentMethod.count != 0
      PaymentMethod.all.each do |payment_method|
        labels.push(payment_method.name)
      end
    end

    labels
  end

  def self.set_wallet_values
    values = []

    if PaymentMethod.count != 0
      PaymentMethod.all.each do |payment_method|
        amount = 0.0
        payment_method.sales.each do |sale|
          amount += sale.invoicing
        end
        payment_method.spendings.each do |spending|
          amount -= spending.price
        end
        payment_method.cash_registers.each do |cash|
          if cash.add_money == true
            amount += cash.amount
          else
            amount -= cash.amount
          end
        end

        values.push(amount.round(2))
      end
    end

    values
  end

  def self.values_and_labels_to_hash
    values_and_labels_hash = {}

    set_wallet_labels.each_with_index do |label, index|
      values_and_labels_hash[label] = set_wallet_values[index]
    end

    values_and_labels_hash.each do |key, value|
      if value == 0
        values_and_labels_hash.delete(key)
      end
    end

    values_and_labels_hash.sort_by { |key, value| value }.reverse.to_h
  end
end
