import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["minimumStockLevel", "manageInventoryFlag"]

  connect() {
    setTimeout(this.changeManageInventory.bind(this), 50)
  }

  changeManageInventory(e) {
    if (this.manageInventoryFlagTarget.value === "true") {
      this.activateInventoryManagement()
      this.minimumStockLevelTarget.removeAttribute("disabled")
    } else {
      this.deactivateInventoryManagement()
      this.minimumStockLevelTarget.setAttribute("disabled", "disabled")
    }
  }

  activateInventoryManagement() {
    const event = new CustomEvent("tabify-control-tab-event", {
      bubbles: true,
      detail: {
        tabID: "inventory-tab",
        show: true
      }
    })

    this.element.dispatchEvent(event)
  }

  deactivateInventoryManagement() {
    const event = new CustomEvent("tabify-control-tab-event", {
      bubbles: true,
      detail: {
        tabID: "inventory-tab",
        show: false
      }
    })

    this.element.dispatchEvent(event)
  }
}
