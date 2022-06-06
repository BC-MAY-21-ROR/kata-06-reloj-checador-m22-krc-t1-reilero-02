module AuthenticateAdmin
  def authenticate_admin!
    authenticate_employee!
    redirect_to root_path, alert: "You don't have permission to access this page!" unless current_employee.admin?
  end
end
