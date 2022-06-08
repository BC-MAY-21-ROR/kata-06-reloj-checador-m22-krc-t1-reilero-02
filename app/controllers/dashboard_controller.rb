class DashboardController < ApplicationController
  def index
    redirect_to admin_panel_path if signed_in? && current_user.admin?
  end
end
