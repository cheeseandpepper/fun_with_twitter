var TweetTable = React.createClass({
  
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
        return (
          <div key={tweet.data.id} style={tweetStyle}>
            <span dangerouslySetInnerHTML={{__html: tweet.data.text}}></span>
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
