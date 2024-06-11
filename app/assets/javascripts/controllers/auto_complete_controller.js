import { Controller } from "stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = [
    "searchInput",
    "dataContainer",
    "valueInput",
    "item",
    "frame"
  ]
  static values = {
    loadFrom: String,
    queryContext: Object,
    onSelectRequest: Object
  }

  get frameID() {
    return this.frameTarget.attributes["id"].value
  }

  get dataContainerOpen() {
    return !this.dataContainerTarget.classList.contains("is-hidden")
  }

  onSearchInputChange(e) {
    if (e.target.value === "*" || e.target.value.length > 2) {
      this.dataContainerTarget.classList.remove("is-hidden")
      this.performSearch(e.target.value)
    } else {
      this.dataContainerTarget.classList.add("is-hidden")
    }
  }

  performSearch(query) {
    const url = `${this.loadFromValue}${this.buildQueryParams(query)}`
    get(url)
  }

  buildQueryParams(query) {
    let params = { q: query, frame_id: this.frameID }

    if (this.queryContextValue) {
      Object.keys(this.queryContextValue).forEach((param) => {
        if (this.queryContextValue[param][0] === ">") {
          params[param] = document.getElementsByName(
            this.queryContextValue[param].replace(">", "")
          )[0].value
        } else {
          params[param] = this.queryContextValue[param]
        }
      })
    }

    return `?${Object.keys(params)
      .map((param) => `${param}=${params[param]}`)
      .join("&")}`
  }

  currentSelection() {
    for (let i = 0; i < this.itemTargets.length; i++) {
      if (this.itemTargets[i].classList.contains("is-selected")) {
        return this.itemTargets[i]
      }
    }
  }

  onMouseOverItem(e) {
    this.itemTargets.forEach((el) => {
      el.classList.remove("is-selected")
    })

    e.target.classList.add("is-selected")
  }

  closeDataContainer() {
    this.dataContainerTarget.classList.add("is-hidden")
  }

  onLeaveInput() {
    if (this.dataContainerOpen) {
      this.selectCurrent()
      this.closeDataContainer()
    }
  }

  clearSelection() {
    this.searchInputTarget.value = ""
  }

  selectCurrent() {
    const current = this.currentSelection()
    if (!current) return

    this.searchInputTarget.value = current.dataset.text
    this.valueInputTarget.value = current.dataset.id

    this.closeDataContainer()
    this.performOnSelect()
  }

  performOnSelect() {
    console.log(this.onSelectRequestValue)
    if (this.onSelectRequestValue) {
      console.log("ON SELECT")
    }
  }

  onInputFocus() {
    this.searchInputTarget.select()
  }

  onInputType(e) {
    switch (e.keyCode) {
      case 38: // ARRAY UP AND DOWN
      case 40: // ARRAY UP AND DOWN
        if (this.dataContainerOpen) {
          this.moveSelection(e)
          e.preventDefault()
        }
        break
      case 13: // ENTER
        if (this.dataContainerOpen) {
          this.selectCurrent()
          e.preventDefault()
        }

        break
      case 27: // ESC
        if (this.dataContainerOpen) {
          this.closeDataContainer()
          this.clearSelection()
          e.preventDefault()
        }
        break
    }
  }

  moveSelection(e) {
    let directionFactor = 0

    if (e.keyCode === 38) {
      directionFactor = -1
    } else if (e.keyCode === 40) {
      directionFactor = 1
    }

    if (directionFactor === 0) return

    for (let i = 0; i < this.itemTargets.length; i++) {
      if (this.itemTargets[i].classList.contains("is-selected")) {
        if (directionFactor < 0 && i === 0) break
        if (directionFactor > 0 && i >= this.itemTargets.length - 1) break

        this.itemTargets.forEach((el) => {
          el.classList.remove("is-selected")
        })

        this.itemTargets[i + directionFactor].classList.add("is-selected")
        break
      } else if (i >= this.itemTargets.length - 1 && directionFactor > 0) {
        this.itemTargets[0].classList.add("is-selected")
      }
    }
  }
}
