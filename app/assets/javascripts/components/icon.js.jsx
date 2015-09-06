var Icon = React.createClass({
  
  icon: function() {
    switch (this.props.icon) {
      case 'favorite':
        return (
          {
            width: '16px',
            height: '16px',
            display: 'inline',
            background: "url('assets/favorite.png')",
            backgroundRepeat: 'no-repeat',
            paddingRight: '16px',
            paddingLeft: '16px'
          }
        );
      case 'retweet':
        return (
          {
            background: 'url(assets/retweet.png)',
            width: '16px',
            height: '16px',
            backgroundRepeat: 'no-repeat',
            paddingRight: '16px',
            paddingLeft: '16px'
          }
        );
    }
  },

  render: function() {
    return(
      <span className='icon' style={this.icon()}> </span>
    );
  }
})
