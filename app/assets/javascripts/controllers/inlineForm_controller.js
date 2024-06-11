import { Controller } from "stimulus"
import { useDebounce } from "../utils/useDebounce"

export default class extends Controller {
  connect() {
    useDebounce(this)
    this.loading = []
  }

  onPostSuccess() {
    this.clearLoading()
  }

  submitForm(target) {
    this.setLoading(target)
    Rails.fire(this.element, "submit")
  }

  setLoading(target) {
    const toLoading = target.parentElement
    this.loading.push(target)
    toLoading.classList.add("is-loading")
  }

  clearLoading() {
    this.loading.forEach((e) => e.parentElement.classList.remove("is-loading"))
  }

  save(e) {
    this.debounce(() => {
      this.submitForm(e.target)
    }, 200)
  }
}
