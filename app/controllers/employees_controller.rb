class EmployeesController < ApplicationController
  include Controllers::Crudify
  model_klass Employee

  before_action :check_registration_path, only: %i(index new)

  def new
    super
    @employee.build_address
  end

  def edit
    super
    @employee.build_address if @employee.address.nil?
  end

  def fire_employee
    @employee = Employee.find_by(id: params[:employee])

    @employee.update(came_out_in: Date.current)
    redirect_to employees_path, notice: 'Alterções salvas'
  end

  def rehire_employee
    @employee = Employee.find_by(id: params[:employee])

    @employee.update(came_out_in: nil)
    redirect_to employees_path, notice: 'Alterções salvas'
  end

  private

  def check_registration_path
    unless CompanyPosition.count > 0
      redirect_to new_company_position_path, notice: 'Cadastre uma Função primeiro!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:employee).permit(
      :name, :phone, :company_position_id, :wage, :receives,
      :entred_in, :came_out_in, :receives_when, :entry_date,
      :commission, :commission_percentage,
      Address.permited_params
    )
  end
end
