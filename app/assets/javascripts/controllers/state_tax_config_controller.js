import { Controller } from "stimulus"
import { useRoutes, useFetch } from "../utils/all"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["ncmSearch", "ncms"]
  connect() {
    useRoutes(this)
    useFetch(this)

    this.mountNcmSearchSelect()
    this.mountCfopSearchSelect()
  }

  get includedNcms() {
    return this.ncmsTargets.map((item) => item.value)
  }

  addNcm() {
    const id = this.ncmSearchTarget.value
    get(this.routes.addNcmStateTaxConfiguration({ id }))
    this.ncmSearchTarget.selectize.clear()
  }

  removeNcm(e) {
    if (confirm("Deseja mesmo remover este NCM?")) {
      const id = e.currentTarget.dataset["ncmId"]
      $(`#ncm-item-${id}`).hide()
      $(`#ncm-item-${id} .destroy`).val("true")
    }
  }

  mountNcmSearchSelect() {
    const http = this.http
    const url = this.routes.api.ncmSearchPath()

    this.ncmSearchInstance = $("#ncm_search").selectize({
      valueField: "id",
      labelField: "text",
      searchField: "text",
      openOnFocus: true,
      load: function (query, callback) {
        if (query.length === 0) return callback()
        const alreadyIncluded = this.includedNcms
        console.log(alreadyIncluded)
        http
          .get(url, { q: query })
          .then((res) => {
            callback(
              res
                .filter(
                  (item) => alreadyIncluded.indexOf(item.id.toString()) < 0
                )
                .map((item) => ({
                  id: item.id,
                  text: `${item.code} - ${item.description}`
                }))
            )
          })
          .catch(() => {
            callback()
          })
      }.bind(this)
    })
  }

  mountCfopSearchSelect() {
    const http = this.http
    const url = this.routes.api.cfopSearchPath()

    $("#state_tax_configuration_cfop_id").selectize({
      valueField: "id",
      labelField: "text",
      searchField: "text",
      openOnFocus: true,
      load: function (query, callback) {
        if (query.length === 0) return callback()

        http
          .get(url, { q: query })
          .then((res) => {
            callback(
              res.map((item) => ({
                id: item.id,
                text: `${item.code} - ${item.description}`
              }))
            )
          })
          .catch(() => {
            callback()
          })
      }
    })
  }
}
