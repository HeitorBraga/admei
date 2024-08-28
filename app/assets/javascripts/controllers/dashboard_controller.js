import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    invoicing: Number,
    cost: String,
    collaboratorsRanking: Object,
    productSalesRanking: Object,
    selectedMonth: String
  }

  static targets = [
    "dropdownFilterMonth"
  ]

  connect() {
    this.setDropdownMonth(this.selectedMonthValue)

    this.createInvoicingVsCostChart()
    this.createCollaboratorsRankingChart()
    this.createProductSalesRankingChart()
  }

  dropdownMonthFilter(e) {
    this.setDropdownMonth(e.target.innerText)
    this.setMonth(e.target.innerText)
  }

  setDropdownMonth(month) {
    if($("#selected-month")[0].innerText.length == 0) {
      $("#selected-month").html(month)
    }
  }

  setMonth(month) {
    window.location = '/?month=' + month
  }

  activeMonthDropdown(e) {
    $(this.dropdownFilterMonthTarget).toggleClass("is-active")
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
      $('.invoicing-vs-cost-no-data').removeClass('is-hidden')
    }
  }

  createCollaboratorsRankingChart() {
    const ctx_bar = $('#collaborators-ranking-chart')

    if((!$.isEmptyObject(this.collaboratorsRankingValue)) && (ctx_bar.length != 0)) {
      new Chart(ctx_bar, {
        type: "bar",
        data: {
          labels: Object.keys(this.collaboratorsRankingValue),
          datasets: [{
            barPercentage: 0.7,
            label: "",
            data: Object.values(this.collaboratorsRankingValue)
          }]
        },
        options: {
          plugins: {
            legend: {
              display: false
            }
          },
          indexAxis: 'y'
        }
      })
    }
  }

  createProductSalesRankingChart() {
    const ctx_bar = $('#product-sales-ranking-chart')

    if((!$.isEmptyObject(this.productSalesRankingValue)) && (ctx_bar.length != 0) ) {
      new Chart(ctx_bar, {
        type: 'bar',
        data: {
          labels: Object.keys(this.productSalesRankingValue),
          datasets: [{
            barPercentage: 0.7,
            label: '',
            data: Object.values(this.productSalesRankingValue)
          }]
        },
        options: {
          plugins: {
            legend: {
              display: false
            }
          },
          indexAxis: 'y'
        }
      })
    } else {
      $(ctx_bar).addClass('is-hidden')
      $('.sales-ranking-no-data').removeClass('is-hidden')
    }
  }
}
