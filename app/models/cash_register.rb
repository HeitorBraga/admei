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
end