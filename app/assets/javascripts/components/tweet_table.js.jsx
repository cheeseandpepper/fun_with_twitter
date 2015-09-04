var TweetTable = React.createClass({
  
  render: function() {
    if (this.props.data.html) {
      var tweetNodes = <td dangerouslySetInnerHTML={{__html: this.props.data.html}}></td>;
    } else {
      var tweetNodes = this.props.data.map(function (tweet) {
        return (
          <tr key={tweet.data.id}>
            <td dangerouslySetInnerHTML={{__html: tweet.data.text}}></td>
          </tr>
        );
      });
    }

    return (
      <table className='table'>
        <tr>
          <th>Tweet</th>
        </tr>
        {tweetNodes}
      </table>
    );
  }
});
