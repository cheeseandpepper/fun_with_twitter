var TweetList = React.createClass({
  
  render: function() {
    var tweetSectionStyle = {
      marginTop: '5px',
      listStyle: 'none',
      padding: 0
    }

    var tweetStyle = {
      padding: '10px',
      border: '1px solid black',
      borderRadius: '10px'
    }


    if (this.props.data.html) {
      var tweetNodes = <span dangerouslySetInnerHTML={{__html: this.props.data.html}}></span>;
    } else {
      var tweetNodes = this.props.data.map(function (tweet) {
      favoriteCount = Utility.addCommasToNumbers(tweet.data.favorite_count)
      retweetCount = Utility.addCommasToNumbers(tweet.data.retweet_count)
        return (
          <div key={tweet.data.id} style={tweetStyle}>
            <span dangerouslySetInnerHTML={{__html: tweet.data.text}}></span>
            <br />
            
            <span><Icon icon='favorite'/>{favoriteCount}</span>
            <br />
            <span><Icon icon='retweet'/>{retweetCount}</span>
          </div>
        );
      });
    }

    return (
      <div className='tweetSection' style={tweetSectionStyle}>
        {tweetNodes}
      </div>
    );
  }
});
