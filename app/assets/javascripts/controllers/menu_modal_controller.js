import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    wallet: Object
  }

  static targets = [
    "modal",
    "chart",
    "cashRegisterInputsContainer",
    "walletContainer"
  ]

  connect() {
    this.createWalletChart()
  }

  activeModal() {
    $(this.modalTarget).addClass("is-active")
  }

  closeModal() {
    $(this.modalTarget).removeClass("is-active")
  }

  showInputs() {
    $(this.cashRegisterInputsContainerTarget).removeClass("is-hidden")
    $(this.walletContainerTarget).addClass("is-hidden")
  }

  hiddeInputs() {
    $(this.cashRegisterInputsContainerTarget).addClass("is-hidden")
    $(this.walletContainerTarget).removeClass("is-hidden")
  }

  createWalletChart() {
    const ctx_bar = $(this.chartTarget)

    if(!$.isEmptyObject(this.walletValue)) {
      new Chart(ctx_bar, {
        type: "bar",
        data: {
          labels: Object.keys(this.walletValue),
          datasets: [{
            barPercentage: 0.5,
            label: "",
            data: Object.values(this.walletValue)
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
}
