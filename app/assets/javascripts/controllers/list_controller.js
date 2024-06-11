import { Controller } from "stimulus"
import { useFetch } from "../utils/useFetch"

export default class extends Controller {
  static targets = ["items", "massActionsContainer", "uniqueActions"]

  connect() {
    this.hideMassActionsContainer()
    useFetch(this)
  }

  edit(e) {
    const editUrl =
      e.target.dataset.editUrl || e.target.parentElement.dataset.editUrl

    if (editUrl) {
      Turbo.visit(editUrl)
    }
  }

  destroySelected(evt) {
    const toDelete = this.selectedItemsIds
    const destroyUrl = evt.target.dataset.destroyUrl.replace(
      ":id:",
      toDelete.join(",")
    )

    if (confirm(`Deseja realmente excluir ${toDelete.length} registros?`)) {
      this.http
        .delete(destroyUrl, { id: toDelete })
        .then(this.destroySelectedCallback.bind(this))
    }
  }

  gotToAction(evt) {
    const id = this.selectedItemsIds[0]
    const actionUrl = evt.target.dataset.actionUrl.replace(":id:", id)
    Turbo.visit(actionUrl)
  }

  destroySelectedCallback(data) {
    $(this.selectedItems).remove()

    const event = new CustomEvent("notification-event", {
      bubbles: true,
      detail: {
        msg: data.msg,
        type: "is-info"
      }
    })

    this.element.dispatchEvent(event)
    this.hideMassActionsContainer()
  }

  itemSelect(evt) {
    if (this.selectedItems.length > 0) {
      this.showMassActionsContainer()

      if (this.selectedItems.length === 1) {
        this.showUniqueActions()
      } else {
        this.hideUniqueActions()
      }
    } else {
      this.hideMassActionsContainer()
      this.hideUniqueActions()
    }
  }

  showUniqueActions() {
    if (this.hasUniqueActionsTarget) $(this.uniqueActionsTarget).show()
  }

  hideUniqueActions() {
    if (this.hasUniqueActionsTarget) $(this.uniqueActionsTarget).hide()
  }

  showMassActionsContainer() {
    $(this.massActionsContainerTarget).show()
  }

  hideMassActionsContainer() {
    $(this.massActionsContainerTarget).hide()
  }

  get selectedItems() {
    return this.itemsTargets.filter((item) =>
      item.querySelector("input[type='checkbox']:checked")
    )
  }

  get selectedItemsIds() {
    return this.selectedItems.map(
      (item) => item.querySelector("input[type='checkbox']:checked").value
    )
  }
}
