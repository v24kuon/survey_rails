import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["frame"]

  connect() {
    let shouldUpdateOrder = false

    this.frameTargets.forEach((frame) => {
      const positionInput = frame.querySelector("input[name$='[position]']")
      if (positionInput && !positionInput.value) {
        shouldUpdateOrder = true
      }
    })

    if (shouldUpdateOrder) {
      this.updateOrder()
    }
  }

  moveUp(event) {
    const frame = event.target.closest("turbo-frame")
    const previousFrame = frame.previousElementSibling
    if (previousFrame && previousFrame.tagName === "TURBO-FRAME") {
      frame.parentNode.insertBefore(frame, previousFrame)
      this.updateOrder()
    }
  }

  moveDown(event) {
    const frame = event.target.closest("turbo-frame")
    const nextFrame = frame.nextElementSibling
    if (nextFrame && nextFrame.tagName === "TURBO-FRAME") {
      frame.parentNode.insertBefore(nextFrame, frame)
      this.updateOrder()
    }
  }

  updateOrder() {
    this.frameTargets.forEach((frame, index) => {
      const positionInput = frame.querySelector("input[name$='[position]']")
      if (positionInput) {
        positionInput.value = index + 1
      }
    })
  }
}
