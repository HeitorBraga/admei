import { Controller } from "stimulus"
import Fuse from "fuse"

export default class extends Controller {
  static targets = ["item"]
  connects() {}

  toggleFavorite(e) {
    e.target.classList.toggle("fas")
    e.target.classList.toggle("far")
  }

  get searchOptions() {
    return {
      includeScore: true,
      keys: ["dataset.productName"]
    }
  }

  searchProduct(e) {
    if (e.target.value == "") {
      this.itemTargets.forEach((item) => item.classList.remove("is-hidden"))
    } else {
      const fuse = new Fuse(this.itemTargets, this.searchOptions)

      this.itemTargets.forEach((item) => item.classList.add("is-hidden"))

      fuse.search(e.target.value).forEach((result) => {
        result.item.classList.remove("is-hidden")
      })
    }
  }
}
