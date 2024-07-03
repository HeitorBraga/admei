import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    invoicing: Number,
    cost: String,
    profit: String,
    sales: Object
  }

  connect() {
    this.createBarChart()
    this.createLineChart()
    this.createDoughnutChart()
  }
  setMonth(e) {
    window.location = '/?month=' + $("#profit_months").val()
  }
  createBarChart() {
    const ctx_bar = $('#chart-bar')

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
    }
  })
  }

  createLineChart() {
    const ctx_profit = $('#profit-chart')

    new Chart(ctx_profit, {
      type: "line",
      data: {
        labels: [0, this.profitValue],
        datasets: [{
          label: "Lucro",
          data: [0, this.profitValue]
        }]
      }
    })
  }

  createDoughnutChart() {
    const ctx_sales = $('#sales-per-product')

    new Chart(ctx_sales, {
      type: "bar",
      data: {
        labels: Object.keys(this.salesValue),
        datasets: [{
          label: "Vendas por Produto",
          data: Object.values(this.salesValue),
          indexAxis: 'y',
          barThickness: 80
        }]
      }
    })
  }
}
