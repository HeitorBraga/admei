import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    invoicing: Number,
    cost: String,
  }

  static targets = [
    "dropdownFilterMonth",
    "dropdownFilterCollaborator"
  ]

  connect() {
    const month = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];

    this.createInvoicingVsCostChart()
    this.setDropdownMonth(month[new Date().getMonth()])
  }

  dropdownFilter(e) {
    this.setDropdownMonth(e.target.innerText)
    this.setMonth(e.target.innerText)
  }

  setDropdownMonth(month) {
    $("#selected-month").html(month)
  }

  activeDropdown(e) {
    if (e.target.id == "month") {
      $(this.dropdownFilterMonthTarget).toggleClass("is-active")
    } else {
      $(this.dropdownFilterCollaboratorTarget).toggleClass("is-active")
    }
  }

  closeDropdown(e) {
    if (e.target.id == "month") {
      $(this.dropdownFilterMonthTarget).removeClass("is-active")
    } else {
      $(this.dropdownFilterCollaboratorTarget).removeClass("is-active")
    }
  }

  setMonth(month) {
    window.location = '/?month=' + month
  }

  createInvoicingVsCostChart() {
    const ctx_bar = $('#invoicing-vs-cost-chart')

    if(this.invoicingValue != 0 || this.costValue != 0.0) {
      new Chart(ctx_bar, {
        type: "bar",
        data: {
          labels: ["Faturamento", "Gastos"],
          datasets: [{
            label: "Faturamento X Gastos",
            data: [this.invoicingValue, this.costValue],
            backgroundColor: [
              'rgba(54,162,235,0.2)',
              'rgba(255,99,132,0.2)'
            ],
            borderColor: [
              'rgba(54,162,235)',
              'rgba(255,99,132)'
            ],
            borderWidth: 1
          }]
        },
        options: {
          plugins: {
            legend: {
              display: false
            }
          }
        }
      })
    } else {
      ctx_bar.addClass('is-hidden')
    }
  }
}
