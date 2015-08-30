class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_sign_in!
    authenticate_user!

    unless current_user  
      sign_out :user
      redirect_to new_user_session_path, alert: 'You do not have access to this site'
    end
  end
end
