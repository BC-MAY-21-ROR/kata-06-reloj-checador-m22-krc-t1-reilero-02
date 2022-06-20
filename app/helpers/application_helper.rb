module ApplicationHelper
  def signed_in_user_admin?
    user_signed_in? && current_user.role == 'admin'
  end

  def current_path?(path)
    'active' if request.path.include? path
  end
end
