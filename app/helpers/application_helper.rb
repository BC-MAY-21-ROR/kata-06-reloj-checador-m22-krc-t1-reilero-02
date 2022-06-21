module ApplicationHelper
  def signed_in_user_admin?
    user_signed_in? && current_user.role == 'admin'
  end

  def is_root_page?
    request.path == '/'
  end

  def current_path?(path)
    print(path)
    'active' if request.path.include? path
  end
end
