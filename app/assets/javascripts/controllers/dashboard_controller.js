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
    "dropdownFilterMonth",
    "dropdownFilterYear"
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
  dropdownYearFilter(e) {
    this.setDropdownYear(e.target.innerText)
    this.setYear(e.target.innerText)
  }

  setDropdownMonth(month) {
    if ($("#selected-month")[0].innerText.length == 0) {
      $("#selected-month").html(month)
    }
  }

  setDropdownYear(year) {
    if ($("#selected-year")[0].innerText.length == 0) {
      $("#selected-year").html(year)
    }
  }

  setMonth(month) {
    let link = window.location.toString()

    if (link.includes('month') && (link.includes('year'))) {
      var params = link.split('?')[1].split('&')
      if (params[0].includes('month')) {
        var year = params[1]
        window.location = '/?month=' + month + '&' + year
      } else if (params[1].includes('month')) {
        var year = params[0]
        window.location = '/?month=' + month + '&' + year
      }
    } else if (link.includes('month') && (!link.includes('year'))) {
      window.location = '/?month=' + month
    } else if (!link.includes('month') && (link.includes('year'))) {
      window.location = window.location + '&month=' + month
    } else {
      window.location = '/?month=' + month
    }
  }

  setYear(year) {
    let link = window.location.toString()

    if (link.includes('year') && (link.includes('month'))) {
      var params = link.split('?')[1].split('&')
      if (params[0].includes('year')) {
        var month = params[1]
        window.location = '/?year=' + year + '&' + month
      } else if (params[1].includes('year')) {
        var month = params[0]
        window.location = '/?year=' + year + '&' + month
      }
    } else if (link.includes('year') && (!link.includes('month'))) {
      window.location = '/?year=' + month
    } else if (!link.includes('year') && (link.includes('month'))) {
      window.location = window.location + '&year=' + year
    } else {
      window.location = '/?year=' + year
    }
  }

  activeMonthDropdown(e) {
    $(this.dropdownFilterMonthTarget).toggleClass("is-active")
  }

  activeYearDropdown(e) {
    $(this.dropdownFilterYearTarget).toggleClass("is-active")
  }


  createInvoicingVsCostChart() {
    const ctx_bar = $('#invoicing-vs-cost-chart')

    if (this.invoicingValue != 0 || this.costValue != 0.0) {
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

    if ((!$.isEmptyObject(this.collaboratorsRankingValue)) && (ctx_bar.length != 0)) {
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

    if ((!$.isEmptyObject(this.productSalesRankingValue)) && (ctx_bar.length != 0)) {
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
