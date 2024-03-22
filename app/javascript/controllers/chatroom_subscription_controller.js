import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number, username: String }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          this.#insertMessageAndScrollDown(data)
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    const parsedData = JSON.parse(data);
    this.messagesTarget.insertAdjacentHTML("beforeend", parsedData.message);

    const insertedMessageElement = this.messagesTarget.lastElementChild;

    if (parsedData.user_id === this.userIdValue) {
      insertedMessageElement.classList.add("my-message");
      insertedMessageElement.querySelector("strong").textContent = "You";
      insertedMessageElement.style.backgroundColor = "#b2f0ff";
    } else {
      insertedMessageElement.classList.add("other-message");
      insertedMessageElement.style.backgroundColor = "#f4ffa1";
      insertedMessageElement.querySelector("strong").textContent = parsedData.username;
    }

    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }


  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
