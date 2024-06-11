import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["tabs", "items"]

  connect() {
    if (this.hasItemsTarget) {
      this.items[0].classList.add("is-active")
    }
    this.tabs[0].classList.add("is-active")

    document.addEventListener(
      "tabify-control-tab-event",
      this.receivePush.bind(this)
    )
  }

  get tabs() {
    return this.tabsTarget.children
  }

  get items() {
    return this.itemsTarget.children
  }

  receivePush(evt) {
    const { tabID, show } = evt.detail

    for (let i = 0; i < this.tabs.length; i++) {
      if (this.tabs[i].dataset["tabId"] === tabID) {
        if (show) {
          this.tabs[i].classList.remove("is-hidden")
        } else {
          this.tabs[i].classList.add("is-hidden")
        }
      }
    }
  }

  selectedIndex(selected) {
    for (let i = 0; i < this.tabs.length; i++) {
      if (selected == this.tabs[i]) return i
    }
  }

  clearSelection() {
    for (let i = 0; i < this.tabs.length; i++) {
      this.tabs[i].classList.remove("is-active")
      if (this.hasItemsTarget) {
        this.items[i].classList.remove("is-active")
      }
    }
  }

  select(e) {
    this.clearSelection()
    if (this.hasItemsTarget) {
      const selectedEl = this.items[this.selectedIndex(e.target.parentElement)]
      if (selectedEl) {
        selectedEl.classList.add("is-active")
      }
    }

    e.target.parentElement.classList.add("is-active")
  }
}
