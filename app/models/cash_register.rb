class CashRegister < ApplicationRecord
  belongs_to :payment_method

  expect_comma_for :amount

  default_scope { order(created_at: :desc) }

  def self.amount_available()
    amounts_per_month = []

    Profit.setYears.each do |year|
      Profit.setMonths.each do |month|
        month_number = month.to_date.strftime("%m").to_i
        month_profit = Profit.setProfit(month_number, year.to_i)

        month_cash = CashRegister.where(month: month_number).map do |cash|
          if cash.created_at.year.to_i == year.to_i
            if cash.add_money == true
              cash.amount
            else
              cash.amount * -1
            end
          else
            0.0
          end
        end

        month_cash = month_cash.inject(0) { |sum, x| sum + x }
        amounts_per_month.push(month_cash + month_profit)
      end
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
