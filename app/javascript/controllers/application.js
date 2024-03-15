import { Application } from "@hotwired/stimulus"

const application = Application.start()

application.registerActionOption("open", ({ event }) => {
  if (event.type == "toggle") {
    return event.target.open == true
  } else {
    return true
  }
})

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
