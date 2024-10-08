class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def layout_by_resource
    if devise_controller?
      "device"
    else
      "application"
    end
  end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
