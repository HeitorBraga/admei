class EmployeeOvertimesController < ApplicationController
  include Controllers::Crudify
  model_klass EmployeeOvertime

  def create
    EmployeeOvertime.create(
      employee_id: params["employee_overtime"]["employee_id"],
      date: params["employee_overtime"]["date"],
      hours: params["employee_overtime"]["hours"]
    )

    redirect_to employees_url, notice: 'Hora Extra Registrada'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:employee_overtime).permit(:employee_id, :date, :hours)
  end
end
