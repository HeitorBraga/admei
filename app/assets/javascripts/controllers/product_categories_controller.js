import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["kind"]

  connect() {
    $(this.kindTarget).on("change", this.changeKind.bind(this)).change()
    this.setupTabs()
    this.setupCocoonEvents()
    this.setupProductSizesSortable()
    this.setupPizzaEdgesSortable()
    this.setupPizzaDoughsSortable()
  }

  rebuildProductSizesSortable() {
    $("#product-sizes-items").sortable("destroy")
    this.setupProductSizesSortable()
  }

  setupProductSizesSortable() {
    $("#product-sizes-items").sortable({
      animation: 150,
      swapClass: "sortable-highlight", // The class applied to the hovered swap item
      selectedClass: "sortable-selected", // The class applied to the selected items
      handle: ".sortable-handle",
      onEnd: function () {
        $(
          "#product-sizes-items .product_category_product_sizes_position input"
        ).each((i, item) => {
          $(item).val(i)
        })
      }
    })
  }

  rebuildPizzaDoughsSortable() {
    $("#pizza-doughs-items").sortable("destroy")
    this.setupPizzaDoughsSortable()
  }

  setupPizzaDoughsSortable() {
    $("#pizza-doughs-items").sortable({
      animation: 150,
      swapClass: "sortable-highlight", // The class applied to the hovered swap item
      selectedClass: "sortable-selected", // The class applied to the selected items
      handle: ".sortable-handle",
      onEnd: function () {
        $(
          "#pizza-doughs-items .product_category_pizza_doughs_position input"
        ).each((i, item) => {
          $(item).val(i)
        })
      }
    })
  }

  rebuildPizzaEdgesSortable() {
    $("#pizza-edges-items").sortable("destroy")
    this.setupPizzaEdgesSortable()
  }

  setupPizzaEdgesSortable() {
    $("#pizza-edges-items").sortable({
      animation: 150,
      swapClass: "sortable-highlight", // The class applied to the hovered swap item
      selectedClass: "sortable-selected", // The class applied to the selected items
      handle: ".sortable-handle",
      onEnd: function () {
        $(
          "#pizza-edges-items .product_category_pizza_edges_position input"
        ).each((i, item) => {
          $(item).val(i)
        })
      }
    })
  }

  setupTabs() {
    $(".tabs li").on("click", function () {
      var tab = $(this).data("tab")

      $("#tabs li").removeClass("is-active")
      $(this).addClass("is-active")

      $("#tab-content div").removeClass("is-active")
      $(`div[data-content="${tab}"]`).addClass("is-active")
    })
  }

  setupCocoonEvents() {
    $("#product-sizes").on(
      "cocoon:after-insert",
      function (e, insertedItem, originalEvent) {
        $(insertedItem).find('input[type="text"]').first().focus()
        $(insertedItem)
          .find(".product_category_product_sizes_position input")
          .val(
            $("#product-sizes .product_category_product_sizes_position")
              .length - 1
          )
        this.rebuildProductSizesSortable()
      }.bind(this)
    )

    $("#pizza-doughs").on(
      "cocoon:after-insert",
      function (e, insertedItem, originalEvent) {
        $(insertedItem).find('input[type="text"]').first().focus()
        $(insertedItem)
          .find(".product_category_pizza_doughs_position input")
          .val(
            $("#pizza-doughs .product_category_pizza_doughs_position").length -
              1
          )
        Mask().setMasks()
        this.rebuildPizzaDoughsSortable()
      }.bind(this)
    )

    $("#pizza-edges").on(
      "cocoon:after-insert",
      function (e, insertedItem, originalEvent) {
        $(insertedItem).find('input[type="text"]').first().focus()
        $(insertedItem)
          .find(".product_category_pizza_edges_position input")
          .val(
            $("#pizza-edges .product_category_pizza_edges_position").length - 1
          )
        Mask().setMasks()
        this.rebuildPizzaEdgesSortable()
      }.bind(this)
    )
  }

  changeKind() {
    if (this.kindTarget.value == "pizza") {
      $("#pizza-container").show()
    } else {
      $("#pizza-container").hide()
    }
  }
}
