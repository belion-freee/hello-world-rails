class OmniauthController < Devise::OmniauthCallbacksController
  [
    :facebook,
    :twitter,
    [:google_oauth2, :google]
  ].each do |key|
    name, provider = key.is_a?(Array) ? key : [key, key]
    define_method(name) { callback_for(provider) }
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end
