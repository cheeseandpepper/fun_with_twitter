var ProfileArea = React.createClass({
  render: function() {
    if (this.props.data[0]) {
      var imageUrl = this.props.data[0].data.image_url
      var screenName = this.props.data[0].data.screen_name
      var followersCount = Intl.NumberFormat().format(this.props.data[0].data.followers_count) + " followers"
    } else {
      var imageUrl = ""
      var screenName = ""
      var followersCount = ""
    }

    var h3Style = {
      fontSize: 24
    }

    return(
      <div className='profileArea'>
        <img src={imageUrl} />
        <h3 style={h3Style}><a href={'http://twitter.com/' + screenName}>{screenName}</a></h3>
        <p>{followersCount}</p>
      </div>
    );
  }
})
