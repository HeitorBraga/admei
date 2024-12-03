//= require jquery.maskMoney
//= require jquery.mask

const Mask = () => {
  const percentageMasks = ["0%", "00%"]

  const phoneMasks = ["(00) 00000-0000", "(00) 0000-00000"]
  const maskBehavior = (val) =>
    val.length > 14 ? phoneMasks[0] : phoneMasks[1]

  return {
    setMasks: () => {
      $("[data-mask=negative-float]").maskMoney({
        symbol: "",
        decimal: ",",
        thousands: ".",
        allowZero: true,
        allowNegative: true,
        precision: 3
      })

      $("[data-mask=float]").maskMoney({
        symbol: "",
        decimal: ",",
        thousands: ".",
        allowZero: true,
        precision: 3
      })

      $("[data-mask=negative-currency]").maskMoney({
        symbol: "",
        decimal: ",",
        thousands: "",
        allowZero: true,
        allowNegative: true
      })

      $("[data-mask=currency]").maskMoney({
        symbol: "",
        decimal: ",",
        thousands: "",
        allowZero: true
      })

      $("[data-mask=weight]").maskMoney({
        symbol: "",
        decimal: ",",
        thousands: "",
        allowZero: true,
        precision: 3
      })

      $("[data-mask=integer]").mask("000000000000000")
      $("[data-mask=zip]").mask("#####-###")
      $("[data-mask=phone]").mask(maskBehavior, {
        onKeyPress: (val, e, field, options) => {
          field.mask(maskBehavior(val, e, field, options), options)
        }
      })
      $("[data-mask=date]").mask("##/##/####")
      $("[data-mask=time]").mask("##:##")
      $("[data-mask=cpf]").mask("###.###.###-##")
      $("[data-mask=cnpj]").mask("##.###.###/####-##")
      $("[data-mask=money]").maskMoney({
        prefix: "R$ ",
        decimal: ",",
        thousands: "",
        allowZero: true
      })
    }
  }
}

document.addEventListener("turbo:load", Mask().setMasks)
$(Mask().setMasks)
