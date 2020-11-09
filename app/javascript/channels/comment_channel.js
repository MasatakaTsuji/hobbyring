import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<li>${data.content.user_id.name} ${data.content.text}</li>`;
    const comment = document.getElementById('comment');
    const newComment = document.getElementById('comments-text');
    comment.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
