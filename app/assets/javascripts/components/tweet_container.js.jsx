var TweetContainer = React.createClass({
  
  getInitialState: function() {
    return {data: []};
  },
 
  render: function() {
    var tweetContainerStyle = {
      display: "block",
      margin: '25px'
    }
    return (
      <div className="tweetContainer" style={tweetContainerStyle}>
        <TwitterForm data={this.props.data}/>
      </div>
    );
  }
});
