class DashboardController < ApplicationController
  def index
    redirect_to admin_panel_path if signed_in? && current_employee.admin?
  end
end
