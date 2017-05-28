$(() => {
  const newComment = $('input.form-control').text()

    $('.make-comment').on('click', function (event) {
      event.preventDefault();
          $.ajax({
      method: "POST",
      url: "/api/comment",
      data: $("form").serialize()

    })

            $.ajax({
      method: "GET",
      url: "/api/comment"

    }).done( (data) => {

         $('<div>').text(data).appendTo($('.container'));
     })
  })
})

