module AuthenticateAdmin
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, alert: "You don't have permission to access this page!" unless current_user.admin?
  end
end
