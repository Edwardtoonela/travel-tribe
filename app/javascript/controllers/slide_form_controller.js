import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["input", "next"]

  next(event) {
    this.active = this.inputTargets.filter(target => target.classList.contains('show_input'))[0]
    console.log(this.active)
    if (this.active.nextElementSibling.nextElementSibling === null) {
      this.forwardSlideShow(this.active)
      this.nextTarget.classList.add('hide_input')
    } else {
      this.forwardSlideShow(this.active)
    }
  }

  forwardSlideShow(active) {
    active.classList.remove('show_input')
    active.classList.add('hide_input')
    active.nextElementSibling.classList.remove('hide_input')
    active.nextElementSibling.classList.add('show_input')
  }
}
