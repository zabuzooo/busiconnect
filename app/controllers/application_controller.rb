class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_phonetic, :postal, :address, :place_field_id, :tell])
   devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_phonetic, :postal, :address, :place_field_id, :tell])
 end
end
