var TweetTable = React.createClass({
  
  render: function() {
    var tweetNodes = this.props.data.map(function (tweet) {
      return (
        <tr key={tweet.data.id}>
          <td dangerouslySetInnerHTML={{__html: tweet.data.text}}></td>
        </tr>
      );
    });
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
