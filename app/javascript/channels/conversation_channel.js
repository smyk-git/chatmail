import consumer from "channels/consumer"

console.log("✅ conversation_channel.js załadowany");

function setupConversationChannel() {
  const container = document.getElementById("conversation")
  if (!container) {
    console.log("ℹ️ Brak #conversation na tej stronie");
    return
  }

  const conversationId = container.dataset.conversationId
  if (!conversationId) {
    console.log("⚠️ #conversation bez data-conversation-id");
    return
  }

  consumer.subscriptions.create(
      { channel: "ConversationChannel", id: conversationId },
      {
        connected() {
          console.log(`🔌 Połączono z ConversationChannel dla rozmowy ${conversationId}`)
        },

        disconnected() {
          console.log("🔌 Odłączono od ConversationChannel")
        },

        received(data) {
          console.log("📩 Otrzymano dane z kanału:", data)

          if (data.message_id) {
            const existing = document.querySelector(`[data-message-id="${data.message_id}"]`)
            if (existing) {
              console.log("↩️ Wiadomość już jest w DOM – pomijam duplikat")
              return
            }
          }

          const messagesList = document.getElementById("messages-list")
          if (!messagesList) {
            console.log("⚠️ Brak #messages-list w DOM");
            return
          }

          if (data.message_html) {
            messagesList.insertAdjacentHTML("beforeend", data.message_html)
            messagesList.scrollTop = messagesList.scrollHeight
          }
        }
      }
  )
}

document.addEventListener("turbo:load", setupConversationChannel)
// document.addEventListener("DOMContentLoaded", setupConversationChannel)
