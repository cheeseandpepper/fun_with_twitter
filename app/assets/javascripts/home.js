TweetData = {};

TweetData.getTweets = function() {

  $('input.tweetButton').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      url:  "/tweet_data",
      method: 'GET',
      data: {
        handle: $('input#handle').val()
      },
      success: function(data) { 
        $('.tweetData').html(data.html);
      },
      error: function(xhr, status, error) {
        console.log(xhr + status + error)
      }
    });
  })
}

