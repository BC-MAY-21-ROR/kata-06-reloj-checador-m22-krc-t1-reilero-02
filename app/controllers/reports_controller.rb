class ReportsController < ApplicationController
  include AuthenticateAdmin   
  before_action :authenticate_admin!
  def index
    @today_attendance = Attendance.all
  end
end
