import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['form']

  onNewForm(event) {
    const [,, xhr] = event.detail
    this.formTarget.innerHTML = eval(xhr.response)
  }

  onCommentSuccess(event) {
    const [,, xhr] = event.detail
    this.element.innerHTML = eval(xhr.response)
  }
}
