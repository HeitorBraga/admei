import { Controller } from "stimulus"
import { useFetch } from "../utils/useFetch"

export default class extends Controller {
  static targets = ["zip", "address", "district", "state", "city"]

  connect() {
    useFetch(this)

    $(this.stateTarget).on("select2:select", this.fetchCities.bind(this))
  }

  getAddressByCep() {
    this.zipTarget.parentElement.classList.add("is-loading")
    var zip = this.zipTarget.value

    this.http
      .get(`https://apps.widenet.com.br/busca-cep/api/cep/${zip}.json`)
      .then(this.fillAddress.bind(this))
  }

  fillAddress(address) {
    this.addressTarget.value = address.address
    this.districtTarget.value = address.district
    const stateSelect = $(this.stateTarget)
    const stateId = stateSelect.find(`option[uf="${address.state}"]`).val()
    stateSelect.val(stateId).change()

    this.fetchAndSelectCities(this.stateTarget, stateId, address.city)
  }

  fetchAndSelectCities(event, stateId = null, selectedCity = null) {
    this.fetchCities().then(() => {
      const citySelect = $(this.cityTarget)
      const cityId = citySelect.find(`option:contains(${selectedCity})`).val()
      citySelect.val(cityId).change()
    })
  }

  fetchCities(event, stateId = null) {
    stateId = stateId || this.stateTarget.value

    return this.http
      .get(`/states/${stateId}/cities`)
      .then(this.renderCities.bind(this))
  }

  renderCities(cities) {
    $(this.cityTarget).empty()

    cities.forEach((city, i) => {
      $(this.cityTarget).append(
        `<option value="${city.id}">${city.name}</option>`
      )
    })

    this.zipTarget.parentElement.classList.remove("is-loading")
  }
}
