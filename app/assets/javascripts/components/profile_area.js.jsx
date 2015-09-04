var ProfileArea = React.createClass({
  render: function() {
    if (this.props.data[0]) {
      var imageUrl = this.props.data[0].data.image_url
      var screenName = this.props.data[0].data.screen_name
    } else {
      var imageUrl = ""
      var screenName = ""
    }

    var h3Style = {
      fontSize: 24
    }

    return(
      <div className='profileArea'>
        <img src={imageUrl} />
        <h3 style={h3Style}><a href={'http://twitter.com/' + screenName}>{screenName}</a></h3>
      </div>
    );
  }
})
