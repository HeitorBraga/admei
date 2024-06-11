import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["personType"]

  connect() {
    $(".legal-person-fields").hide()
    $(this.personTypeTarget)
      .on("change", this.changePersonType.bind(this))
      .change()
  }

  changePersonType() {
    if (this.personTypeTarget.value == "natural") {
      $(".natural-person-fields").show()
      $(".legal-person-fields").hide()
    } else {
      $(".natural-person-fields").hide()
      $(".legal-person-fields").show()
    }
  }
}
