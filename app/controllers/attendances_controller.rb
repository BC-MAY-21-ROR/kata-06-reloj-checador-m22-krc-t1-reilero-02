class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  def index
    @attendance = Attendance.all
  end

  def new
    @attendances = Attendance.new
  end

  def input
    private_number = params[:private_number]
    employee_found(private_number)
  end

  def find_private_number(private_number)
    User.find_by(private_number: private_number)
  end

  
  def employee_found(private_number)
    find_employee = find_private_number(private_number)
    if find_employee
      flash[:employee] = [find_employee, Attendance.where(users_id: find_employee[:id]).last]
      flash[:alert] = "correct"
      redirect_to root_path 
    else
      redirect_to root_path 
      flash[:alert] = "invalid"
    end
  end

  private
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end
end
