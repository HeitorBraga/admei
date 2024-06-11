const format = (url, options) => {
  if (!options) return url

  const params = Object.keys(options).filter((item) => item !== "format")

  params.forEach((param) => {
    url = url.replace(`:${param}`, options[param])
  })

  return `${url}${options.format ? `.${options.format}` : ""}`
}

const routes = {
  paymentAcquirersPath: (options) => format("/payment_acquirers", options),
  accountsPath: (options) => format("/accounts", options),
  addNcmStateTaxConfiguration: (options) =>
    format("/state_tax_configurations/:id/add_ncm", options),
  api: {
    customerSearchPath: (options) => format("/api/v1/customer/search", options),
    ncmSearchPath: (options) => format("/api/v1/common/ncms", options),
    cfopSearchPath: (options) => format("/api/v1/common/cfops", options)
  }
}

export const useRoutes = (controller) => {
  Object.assign(controller, { routes })
}
