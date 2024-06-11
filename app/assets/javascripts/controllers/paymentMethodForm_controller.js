import { Controller } from "stimulus"
import { useRoutes, useFetch } from "../utils/all"

export default class extends Controller {
  static targets = [
    "kind",
    "paymentProcessor",
    "paymentProcessorType",
    "paymentProcessorID"
  ]

  connect() {
    useRoutes(this)
    useFetch(this)
    this.changeKind()
  }

  get kind() {
    return this.kindTarget.value
  }

  toggleLoading() {
    this.paymentProcessorTarget.parentElement.classList.toggle("is-loading")
    this.kindTarget.parentElement.classList.toggle("is-loading")
  }

  changeKind() {
    if (this.kind === "" || this.kind === "money") {
      this.disablePaymentProcessor()
    } else if (this.kind === "plastic") {
      this.loadAcquires()
    } else if (this.kind === "direct_transfer") {
      this.loadAccounts()
    }
  }

  changePaymentProcessor(e) {
    this.paymentProcessorIDTarget.value = e.target.value
  }

  clearPaymentProcessors() {
    this.paymentProcessorTarget.innerHTML = ""
  }

  disablePaymentProcessor() {
    this.clearPaymentProcessors()
    this.paymentProcessorTarget.setAttribute("disabled", "disabled")
  }

  enablePaymentProcessor() {
    this.paymentProcessorTarget.removeAttribute("disabled")
  }

  loadAccounts() {
    this.loadData("Account")
  }

  loadAcquires() {
    this.loadData("PaymentAcquirer")
  }

  paymentProcessorUrl(processorType) {
    if (processorType === "PaymentAcquirer") {
      return this.routes.paymentAcquirersPath({ format: "json" })
    } else if (processorType === "Account") {
      return this.routes.accountsPath({ format: "json" })
    }
  }

  loadData(processorType) {
    this.clearPaymentProcessors()
    this.toggleLoading()

    const paymentProcessor = this.paymentProcessorTarget
    paymentProcessor.options.add(new Option("Selecione...", null, true))
    this.paymentProcessorTypeTarget.value = processorType

    this.http.get(this.paymentProcessorUrl(processorType)).then((data) => {
      data.forEach((processor) => {
        const selected = this.paymentProcessorIDTarget.value == processor.id
        paymentProcessor.options.add(
          new Option(processor.name, processor.id, false, selected)
        )
      })

      this.enablePaymentProcessor()
      this.toggleLoading()
    })
  }
}
