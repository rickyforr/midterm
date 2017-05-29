$(() => {
 $('.edit-button').on('click', function (event) {
  event.preventDefault()
    $.ajax({
      method: "GET",
      url: "/comments_table",
    }).done( (data) => {
for (let key in data) {
        console.log(data[key].c_text)
        let text = data[key].c_text
        let user = data[key].user_id
        let date = data[key].created_at
      $(`<div id="comment" class="container">
          <div class="form-group">
            <label class="form-control-label" for="commentuser">${user}</label>
            <h6 class="text-muted time">${date}</h6>
            <p class="comment">${text}</p>
          </div>
         </div>`).appendTo($('.comments'));
    }
    })
  })
});
