import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["orders", "productQuery"]

  connect() {
    document.addEventListener(
      "turbo:before-stream-render",
      this.tabsNavigation.bind(this)
    )
  }

  tabsNavigation(e) {
    const target = e.target.getAttribute("target")
    const action = e.target.getAttribute("action")

    if (target == "demo_orders" && action == "append") {
      const href = document.querySelector(
        "#food-orders-mode-tab ul li.is-active a"
      ).href
      this.ordersTarget.src = href

      e.preventDefault()
    }
  }
}
