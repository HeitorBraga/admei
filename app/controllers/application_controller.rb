class ApplicationController < ActionController::Base
  include Controllers::Searchable
  include Controllers::Authenticate
  include SetCurrentRequestDetails

  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  before_action :verify_payment_day
  before_action :company_present

  private

  def set_title(title)
    @title = title
  end

  def render_many_components(components)
    components.map { |c| c.render_in(view_context) }.join('')
  end

  def verify_payment_day
    payment_today = nil
    Employee.active.map do |employee|
      payment_today = set_payment_day(employee.receives_when, employee.receives, employee.name)
    end

    if payment_today.present?
      payment_today.each do |employee, payment_day|
        payment = Spending.where(origin: "Pagamento do(a) " + employee)

        if payment.blank?
          create_payment(employee)
        end
      end
    end
  end

  def company_present
    if Company.last.blank?
      redirect_to new_company_url, notice: 'Para continuar, crie sua Empresa'
    end
  end

  def create_payment(employee)
    Spending.new(
      origin: "Pagamento do(a) " + employee,
      date: Date.current,
      price: Employee.find_by(name: employee).wage,
      payment_method_id: 1,
    ).save
  end

  def set_payment_day(receives_when, receives, name)
    payment_today = {}

    if receives_when == 'weekly'
      day = I18n.t('payment_days.' + receives.to_s) if receives.integer?
      day = receives unless receives.integer?

      payment_today[name] = receives if day == Date.current.strftime('%A').downcase

      payment_today
    elsif receives_when == "biweekly"
      day = I18n.t('payment_days.' + employee.receives.to_s).tr('_', ' ').tr('daynd', '').split(' ')

      day.each do |day|
        payment_today[name] = receives if day.to_i == Date.current.day
      end

      payment_today
    elsif receives_when == "monthly"
      day = I18n.t('payment_days.' + receives.to_s).tr('day_', '')

      if day == 'fifthbusiness'
        fifth_business_day = set_fifth_business_day
        payment_today[name] = receives if fifth_business_day == Date.current.day
      elsif day.to_i == Date.current.day
        payment_today[name] = receives
      end

      payment_today
    end
  end

  def set_fifth_business_day()
    first_bday = Date.new(Date.current.year, Date.current.month, 1)
    first_bday += 1 until first_bday.wday.between?(1, 5)
    bday = 1

    while bday != 5
      if (first_bday + 1).wday == 6
        first_bday += 3
      else
        first_bday += 1
      end
      bday += 1
    end

    fifth_business_day = first_bday if bday == 5
    fifth_business_day.day
  end
end
