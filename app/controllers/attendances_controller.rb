class AttendancesController < ApplicationController
  include AttendencesHelper
  before_action :set_employee
  before_action :redirect_if_employee_not_found

  def check
    @today_attendance = employee_today_attendance

    if should_check_in
      check_in
      redirect_to_root notice: 'Checked in successfully'
    elsif should_check_out
      check_out
      redirect_to_root notice: 'Checked out successfully'
    else
      redirect_to_root alert: 'Already checked out, come back tomorrow'
    end
  end

  private

  def should_check_in
    @today_attendance.nil?
  end

  def should_check_out
    @today_attendance.check_out.nil?
  end

  def check_in
    Attendance.create!(user_id: @employee.id, check_in: now)
  end

  def check_out
    @today_attendance.check_out = now
    @today_attendance.save
  end

  def redirect_if_employee_not_found
    redirect_to_root alert: 'Employee not found' if @employee.nil?
  end

  def set_employee
    @employee = User.find_by_private_number(params[:private_number])
  end

  def employee_today_attendance
    Attendance.where(user_id: @employee.id, check_in: Date.today.all_day).first
  end
end
