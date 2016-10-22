class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => 'investasiku', :password => '123456789'
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admins_dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
