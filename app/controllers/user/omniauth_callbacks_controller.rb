##
# Devise Class for accepting Omniauth calls from Omniauth providers
# Reads data from omniauth callbacks and posts then to User model to set up
# account and profile settings
class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ##
  # Facebook OAuth registration processor
  def facebook
    return unless user_allows_email?
    # Sets up a user with data from Facebook Omniauth if not in database
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      login_oauth_user(@user, 'Facebook')
    else
      # Redirects to registration page if user cannot be saved
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

  private

  ##
  # Signs user in and posts flash message with what provider the user is
  # authenticated by
  def login_oauth_user(user, type)
    sign_in_and_redirect user, event: :authentication
    set_flash_message(:notice, :success,
                      kind: type) if is_navigational_format?
  end

  ##
  # Check whether the FB callback contains the user email
  # Re-request user email permission when not present
  # E-mail is required to register account
  def user_allows_email?
    if request.env['omniauth.auth'].info.email.blank?
      redirect_to '/users/auth/facebook?auth_type=rerequest&scope=email'
      false
    else
      true
    end
  end
end
