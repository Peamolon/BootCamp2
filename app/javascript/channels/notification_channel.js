import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {},

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (Notification.permission === 'granted') {
      var title = 'Hogaru Notification'
      var body = data
      var options = { body: body }
      //new Notification(title, options)
    }
  }
});
