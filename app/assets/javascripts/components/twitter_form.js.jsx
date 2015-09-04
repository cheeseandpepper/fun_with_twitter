var TwitterForm = React.createClass({
  twitterHandleSubmit: function(e) {
    e.preventDefault();
    var handle = $('.twitterForm input').val();
    if ( !handle ) {
      return;
    }

  $.ajax({
      url: '/tweet_data',
      dataType: 'json',
      cache: false,
      data: { handle: $('.twitterForm input').val() || "twitter" },
      success: function(data) {
        this.setState({ data: data });
        $('.twitterForm').find('input:text').val('')
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });


  },

  componentDidMount: function() {
    $.ajax({
      url: '/tweet_data',
      dataType: 'json',
      cache: false,
      data: { handle: $('.twitterForm input').val() || "twitter" },
      success: function(data) {
        if (this.isMounted()) {
          this.setState({data: data})
        }
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
    var currentData; 
    
    if (this.state) {
      currentData = this.state.data
    } else {
      currentData = this.props.data
    }; 

    return (
      <div>
        <ProfileArea data={currentData} />
        <form className="twitterForm" onSubmit={this.twitterHandleSubmit}>
          <input type="text" placeholder="enter a handle" ref="handle" />
          <input type="submit" value="Get Tweets!" />
        </form>
        <TweetTable data={currentData} />
      </div>
    );
  } 
});

