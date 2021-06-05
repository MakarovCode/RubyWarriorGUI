class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      rubywarrior_warriors_path
    elsif resource.is_a?(AdminUser)
      admin_dashboard_path
    end
  end

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      rubywarrior_warriors_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end
end
