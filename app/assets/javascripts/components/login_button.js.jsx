var LoginButton = React.createClass({
  
  render: function() {
    var ButtonToolbar = ReactBootstrap.ButtonToolbar;
    var DropdownButton = ReactBootstrap.DropdownButton;
    var MenuItem = ReactBootstrap.MenuItem;

    if (this.props.current_user) {
      var linkPath = '/users/sign_out';
      var linkText = "Sign Out";
    } else {
      var linkPath = '/users/sign_in';
      var linkText = 'Sign In';
    }

    const buttonInstance = (
      <DropdownButton className='pull-right' bsStyle='primary' title={'Hello ' + this.props.current_user.email} noCaret id='signInButton'>
        <MenuItem eventKey='1' href={linkPath}>{linkText}</MenuItem>
      </DropdownButton>
    
    );
    
    return(
      buttonInstance
    );
  }
})
