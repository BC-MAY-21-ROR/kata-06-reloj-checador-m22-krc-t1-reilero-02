class ReportsController < ApplicationController
  include AuthenticateAdmin
  include AttendencesHelper
  before_action :authenticate_admin!

  def index
    per_page ||= 20
    @pagy, @daily_attendances = pagy(
      Attendance.where(created_at: Date.today.all_day),
      items: per_page
    )
  end

  def attendances_by_day_pdf
    @date_day = Date.today
    @date_day = Date.parse(params[:date_day]) if params[:date_day].present?

    @attendances = Attendance.where(created_at: @date_day.all_day)

    respond_to do |format|
      format.pdf do
        render pdf: "attendace_of_#{@date_day}",
               template: 'reports/attendances_by_day',
               formats: [:html]
      end
    end
  end

  def average_checks_by_month_pdf
    @date_month = current_month
    @date_month = params[:date_month] if params[:date_month].present?
    @average_checks_by_month = AverageChecksByMonth.where(month: @date_month)

    respond_to do |format|
      format.pdf do
        render pdf: "attendace_of_#{@date_month}",
               template: 'reports/average_checks_by_month',
               formats: [:html]
      end
    end
  end
end
