//= require jquery.maskMoney
//= require jquery.mask

import { Controller } from 'stimulus'

export default class extends Controller {

  connect() {
    this.maskInputs()
  }

  maskInputs() {
    $('#costs').on("cocoon:after-insert", function (e, insertedItem) {
      $(insertedItem).find("[data-mask='money']").maskMoney({
        prefix: "R$ ",
        decimal: ",",
        thousands: "",
        allowZero: true
      });
      $(insertedItem).find("[data-mask=integer]").mask("000000000000000")
    })
  }

  costCalculator(e) {
    const input = e.target
    const inputsContainer = $(input).parent().closest('.form-inputs')
    const inputs = $(inputsContainer).children().children().children().children()

    var values = inputs.map(function () {
      if ($(this).val() === "") {
        return 'inputEmpty'
      } else {
        return $(this).val()
      }
    }).slice(0, -1).slice(1)

    const emptyInputs = Object.values(values).filter((val) => val === "inputEmpty").length

    if (emptyInputs === 0) {
      this.setCostInput(values, inputs[6])
    }
  };

  setCostInput(values, input) {
    var cost = this.calculateCost(values)

    $('.save-form .button').attr('disabled', true)
    $(input).parent().addClass('is-loading')
    setTimeout(function () {
      $(input).val(cost)
      $(input).parent().removeClass('is-loading')
      $(input).css("border", "1.5px #48c774 solid")
      $('.save-form .button').attr('disabled', false)
    }, 2000)
  }

  calculateCost(values) {
    var price = this.currencyToNumber(values[3])
    var cost = (price / values[2]) * values[4]
    var formatedCost = this.numberToBRL(cost)

    return formatedCost
  }

  currencyToNumber(number) {
    number = number.replace('R$ ', '')
    number = number.split('.').join("")
    number = number.replace(',', '.')

    return number
  }

  numberToBRL(number) {
    let real = Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    })

    return real.format(number)
  }

  ownProduct(e) {
    const inputsContainer = $(e.target).parent().closest('.form-inputs')
    const productAssociation = inputsContainer.children('.product_association_cost')
    const otherInputs = (inputsContainer.children())
    otherInputs.splice(0, 3)

    if (e.target.checked === true) {
      $(productAssociation).removeClass('is-hidden')
      otherInputs.each(function () {
        $(this).addClass('is-hidden')
      })
    } else {
      $(productAssociation).addClass('is-hidden')
      otherInputs.each(function () {
        $(this).removeClass('is-hidden')
      })
    }
  }
}
