class AttendancesController < ApplicationController
  include AttendencesHelper
  before_action :set_employee
  before_action :redirect_if_employee_not_found

  def check
    @today_attendance = employee_today_attendance
    @avg_checks_month = avg_checks_by_month

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
    update_avg_check_in_month
  end

  def update_avg_check_in_month
    if @avg_checks_month
      n_check_ins = @avg_checks_month.n_check_ins
      avg_checkin_in_minutes = mins_from_midnight(@avg_checks_month.avg_check_in)
      new_avg_minutes = calculate_new_avg_check_of(avg_checkin_in_minutes, n_check_ins)
      @avg_checks_month.update!(avg_check_in: to_datetime(new_avg_minutes), n_check_ins: n_check_ins + 1)
    else
      create_avg_check_in_by_month
    end
  end

  def create_avg_check_in_by_month
    AverageChecksByMonth.create!(
      user_id: @employee.id,
      month: current_month,
      avg_check_in: now,
      n_check_ins: 1
    )
  end

  def check_out
    @today_attendance.check_out = now
    @today_attendance.save
    update_avg_check_out_month
  end

  def update_avg_check_out_month
    if @avg_checks_month.avg_check_out
      n_check_outs = @avg_checks_month.n_check_outs
      avg_checkout_in_minutes = mins_from_midnight(@avg_checks_month.avg_check_out)
      new_avg_minutes = calculate_new_avg_check_of(avg_checkout_in_minutes, n_check_outs)
      @avg_checks_month.update!(avg_check_out: to_datetime(new_avg_minutes), n_check_outs: n_check_outs + 1)
    else
      create_avg_check_out_by_month
    end
  end

  def create_avg_check_out_by_month
    @avg_checks_month.update!(
      user_id: @employee.id,
      month: current_month,
      avg_check_out: now,
      n_check_outs: 1
    )
  end

  def avg_checks_by_month
    AverageChecksByMonth.where(user_id: @employee.id, month: current_month).first
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
