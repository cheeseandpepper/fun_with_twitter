var TopNav = React.createClass({
  
  render: function() {
    return (
      <div className="navContainer">
        <LoginButton current_user={this.props.current_user} />  
      </div>
    );
  }
});
