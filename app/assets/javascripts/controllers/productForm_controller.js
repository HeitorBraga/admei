import { Controller } from "stimulus"
import { useRoutes, useFetch } from "../utils/all"
export default class extends Controller {
  static targets = [
    "manageInventory",
    "minimumStockLevel",
    "inventoryTab",
    "priceFormContainer",
    "productMainPicture"
  ]

  connect() {
    useRoutes(this)
    useFetch(this)
    // Give some time the components are ready to send and receive messages
    setTimeout(this.changeManageInventory.bind(this), 50)
    this.mountProductCategorySelect()
    this.mountCestSearchSelect()
    this.mountNcmSearchSelect()
  }

  changeManageInventory(e) {
    if (this.manageInventoryTarget.value === "true") {
      this.activateInventoryManagement()
    } else {
      this.deactivateInventoryManagement()
    }
  }

  fetchPriceForm(categoryId) {
    fetch(`/products/price_form?product[category_id]=${categoryId}`)
      .then((response) => response.text())
      .then((html) => {
        this.priceFormContainerTarget.innerHTML = html
        Mask().setMasks()
      })
  }

  activateInventoryManagement() {
    this.minimumStockLevelTarget.removeAttribute("disabled")

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
    this.minimumStockLevelTarget.setAttribute("disabled", "disabled")

    const event = new CustomEvent("tabify-control-tab-event", {
      bubbles: true,
      detail: {
        tabID: "inventory-tab",
        show: false
      }
    })

    this.element.dispatchEvent(event)
  }

  mainPictureChange(e) {
    const fileInput = e.target
    if (fileInput.files.length > 0) {
      const reader = new FileReader()

      reader.onload = (e) => {
        this.productMainPictureTarget.setAttribute("src", e.target.result)
      }

      reader.readAsDataURL(fileInput.files[0])
    }
  }

  mountProductCategorySelect() {
    $("select#product_category_id").selectize({
      onChange: (categoryId) => this.fetchPriceForm(categoryId)
    })
  }

  mountCestSearchSelect() {
    this.cestSelect = $("select#product_cest_id").selectize({
      valueField: "id",
      labelField: "text",
      searchField: "text",
      openOnFocus: true,
      load: function (query, callback) {
        if (query.length === 0) return callback()

        const ncmId = $("select#product_ncm_id").val()
        const url = $("select#product_cest_id")
          .data("search-url")
          .replace(":ncm_id:", ncmId)

        $.ajax({
          type: "GET",
          url: url,
          data: {
            q: query
          },
          error: () => {
            callback()
          },
          success: (res) => {
            callback(
              res.map((item) => ({
                id: item.id,
                text: `${item.code} - ${item.description}`
              }))
            )
          }
        })
      }
    })
  }

  mountNcmSearchSelect() {
    $("select#product_ncm_id").selectize({
      valueField: "id",
      labelField: "text",
      searchField: "text",
      openOnFocus: true,
      onChange: () => {
        this.cestSelect[0].selectize.clear()
        this.cestSelect[0].selectize.clearOptions()
      },
      load: function (query, callback) {
        if (query.length === 0) return callback()
        const url = $("select#product_ncm_id").data("search-url")

        $.ajax({
          type: "GET",
          url: url,
          data: {
            q: query
          },
          error: () => {
            callback()
          },
          success: (res) => {
            callback(
              res.map((item) => ({
                id: item.id,
                text: `${item.code} - ${item.description}`
              }))
            )
          }
        })
      }
    })
  }
}
