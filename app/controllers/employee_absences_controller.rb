class EmployeeAbsencesController < ApplicationController
  include Controllers::Crudify
  model_klass EmployeeAbsence

  def create
    EmployeeAbsence.create(
      employee_id: params["employee_absence"]["employee_id"],
      date: params["employee_absence"]["date"],
    )

    redirect_to employees_url, notice: 'Falta Registrada'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:employee_absence).permit(:employee_id, :date, :reason)
  end
end
