class AttendancesController < ApplicationController

  def index
    @attendance = Attendance.all
  end

  def new
    @attendance = Attendance.new
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
      create(find_employee)
      redirect_to root_path 
      flash[:alert] = "correct"
      flash[:employee] = [find_employee, Attendance.where(users_id: find_employee[:id]).last]
     
    else
      redirect_to root_path 
      flash[:alert] = "invalid"
    end
  end

  def create(find_employee)
    time = Time.now.strftime("%d/%m%Y")
    attendance_user = Attendance.where(users_id: find_employee[:id]).last

    
    if !attendance_user.nil?.inspect
      flash[:alert] = "1"
      difference = attendance_user.checked_in.strftime("%d/%m/%Y") != time
    end
    if attendance_user.nil? || difference
      flash[:alert] = "2"
      Attendance.create!(check_in: Time.now, users_id: find_employee[:id])
    elsif attendance_user.check_out.nil?
      flash[:alert] = "3"
      attendance_user.update(check_out: Time.now)
    end
  end
  
end
