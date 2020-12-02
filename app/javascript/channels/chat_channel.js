import consumer from "./consumer";

document.addEventListener('turbolinks:load', () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatId;

    consumer.subscriptions.create({ channel: "ChatChannel", id: id }, {
        received(data) {
          console.log(data)
          messagesContainer.insertAdjacentHTML('beforeend', data);
        }
    });
  }
})
