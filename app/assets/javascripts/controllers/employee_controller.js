import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [
    "receivesInput",
    "receivesWhen",
    "activeEmployees",
    "inactiveEmployees",
    "activeTab",
    "inactiveTab",
    "employeeAbsence",
    "employeeOvertime"
  ]

  connect() {
    this.checkReceivesWhenPresent();
  }

  activeTab() {
    $(this.activeEmployeesTarget).removeClass("is-hidden")
    $(this.inactiveEmployeesTarget).addClass('is-hidden')
    $(this.activeTabTarget).addClass('is-active')
    $(this.inactiveTabTarget).removeClass('is-active')
  }
  inactiveTab(){
    $(this.activeEmployeesTarget).addClass("is-hidden")
    $(this.inactiveEmployeesTarget).removeClass('is-hidden')
    $(this.activeTabTarget).removeClass('is-active')
    $(this.inactiveTabTarget).addClass('is-active')
  }

  toggleEmployeeAbsence() {
    $(this.employeeAbsenceTarget).toggleClass('is-active')
  }

  toggleEmployeeOvertime() {
    $(this.employeeOvertimeTarget).toggleClass('is-active')
  }

  setValues(receives_when) {
    if ( receives_when == "weekly") {
      return {'Domingo': 0, 'Segunda': 1, 'Terça': 2, 'Quarta': 3, 'Quinta': 4, 'Sexta': 5, 'Sábado': 6}
    } else if ( receives_when == "biweekly") {
      return {'Dia 1 e dia 15': 7, 'Dia 5 e dia 20': 8, 'Dia 10 e dia 25': 9}
    } else if ( receives_when == "monthly") {
      return {'Dia 1': 10, 'Dia 2': 11, 'Dia 3': 12, 'Dia 4': 13, 'Dia 5': 14, '5° Dia útil': 15, 'Outro': 16}
    }
  }

  setReceives() {
    var receives_when_value = $(this.receivesWhenTarget)[0].value
    var enum_values = this.setValues(receives_when_value)
    $(this.receivesInputTarget).empty()
    $(this.receivesInputTarget).append('<option></option>')

    Object.keys(enum_values).forEach((key) => {
      $(this.receivesInputTarget).append(
        `<option value="${enum_values[key]}">${key}</option>`,
      )
    })
  }

  checkReceivesWhenPresent() {
    if ($(this.receivesWhenTarget)[0].value.length != 0) {
      this.setReceives()
      console.log($(this.receivesInputTarget))
    }
  }
}
