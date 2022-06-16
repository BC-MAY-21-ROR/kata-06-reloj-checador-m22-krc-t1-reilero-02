class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      admin_panel_path
    else
      root_path
    end
  end

  def redirect_to_root(options = {})
    redirect_to root_path, options
  end
end
