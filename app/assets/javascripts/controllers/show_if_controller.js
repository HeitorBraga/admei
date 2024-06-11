import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["elements"]

  connect() {
    this.elementsTargets.forEach((el) => {
      if (el.dataset.showIfCond) {
        const { leftHand } = this.extractConditional(el.dataset.showIfCond)
        console.log(el.style.display)
        this.apply(
          leftHand,
          this.element.querySelector(`[name="${leftHand}"]`).value
        )
      }
    })
  }

  change(e) {
    this.apply(e.target.name, e.target.value)
  }

  extractConditional(conditional) {
    const [_, leftHand, operator, rightHand] = conditional.match(
      /(.*?) ?([=!]{2,3}) ?(.*)/
    )

    return { leftHand, operator, rightHand }
  }

  apply(operand, value) {
    this.elementsTargets.forEach((el) => {
      if (el.dataset.showIfCond) {
        const { leftHand, operator, rightHand } = this.extractConditional(
          el.dataset.showIfCond
        )

        if (
          leftHand === operand &&
          eval(`'${value}' ${operator} '${rightHand}'`)
        ) {
          el.style.display = ""
        } else {
          el.style.display = "none"
        }
      }
    })
  }
}
