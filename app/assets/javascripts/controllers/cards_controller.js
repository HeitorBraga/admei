import { Controller } from 'stimulus'

export default class extends Controller {
  toggle(e) {
    const body = e.target.parentElement.parentElement.parentElement.querySelector('.card-content')

    if (body.classList.contains("is-hidden")) {
      body.classList.remove("is-hidden")
    } else {
      body.classList.add("is-hidden")
    }
  }
}
