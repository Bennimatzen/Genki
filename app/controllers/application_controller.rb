class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :doctor, :photo, :dob, :nhs_number, :gender])
  end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profile_users_path
  end
end
