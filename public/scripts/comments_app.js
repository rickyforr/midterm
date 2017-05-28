$(() => {
  const newComment = "This is an awesome resource"

    $('.make-comment').on('click', function (event) {

         $.ajax({

            method: 'POST',
            url: '/resource_id',
            data: $('form').serialize(),

          }).done(function(data) {
         newComment = data;
         $(`<div id="comment" class="container">
        <div class="form-group">
        <label class="form-control-label" for="commentuser">User_id</label>
        <h6 class="text-muted time">1 minute ago</h6>
        <p class="comment">${newComment}</p>
         </div>
         </div>`).prependTo($('.comments'));
         });


      //prepend new comment to comments <div>


  });
});
