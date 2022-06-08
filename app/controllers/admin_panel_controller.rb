class AdminPanelController < ApplicationController
  include AuthenticateAdmin
  before_action :authenticate_admin!

  def index; end
end
