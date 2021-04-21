class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :age, :country, :email, :password, :user_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :age, :country, :email, :current_password, :user_id])
    end
end