class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
      @auth = request.env["omniauth.auth"]
      #Use the token from the data to request a list of calendars
      @token = @auth["credentials"]
      # @user.google_token = @token["token"]
      # @user.google_refresh_token = @token["refresh_token"]
      # @user.google_token_expires_at = Time.at @token["expires_at"]
      p request.env["omniauth.auth"]
      @user.save

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
end